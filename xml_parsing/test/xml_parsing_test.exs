defmodule XmlParsingTest do
  use ExUnit.Case
  doctest XmlParsing

  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")


  def sample_xml do
    """
    <html>
      <head>
        <title>XML Parsing</title>
      </head>
      <body>
        <p>Neato</p>
        <ul>
          <li>First</li>
          <li>Second</li>
        </ul>
      </body>
    </html>
    """
  end

  test "parsing the title out" do
    { xml, _rest } = :xmerl_scan.string(String.to_char_list(sample_xml))
    [ title_element ] = :xmerl_xpath.string('/html/head/title', xml)
    [ title_text ] = xmlElement(title_element, :content)
    title = xmlText(title_text, :value)

    assert title == 'XML Parsing'
  end

  test "parsing the p tag" do
    { xml, _rest } = :xmerl_scan.string(String.to_char_list(sample_xml))
    [ p_text ] = :xmerl_xpath.string('/html/body/p/text()', xml)

    assert xmlText(p_text, :value) == 'Neato'
  end

  test "parsing the li tags" do
    { xml, _rest } = :xmerl_scan.string(String.to_char_list(sample_xml))
    li_texts = :xmerl_xpath.string('/html/body/ul/li/text()', xml)
    texts = li_texts
            |> Enum.map(fn(text)-> xmlText(text, :value) end)

    assert texts == ['First', 'Second']
  end
end
