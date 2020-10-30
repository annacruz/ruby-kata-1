require 'rspec'
require '../lib/csv_to_hash.rb'

RSpec.describe CsvToHash do
  it "convert csv data to hash" do
    csv_data = "title;isbn;authors;description\nIch helfe dir kochen. Das erfolgreiche Universalkochbuch mit großem Backteil;5554-5545-4518;null-walter@echocat.org;Auf der Suche nach einem Basiskochbuch steht man heutzutage vor einer Fülle von Alternativen. Es fällt schwer, daraus die für sich passende Mixtur aus Grundlagenwerk und Rezeptesammlung zu finden. Man sollte sich darüber im Klaren sein, welchen Schwerpunkt man setzen möchte oder von welchen Koch- und Backkenntnissen man bereits ausgehen kann.\nDas große GU-Kochbuch Kochen für Kinder;2145-8548-3325;null-ferdinand@echocat.org,null-lieblich@echocat.org;Es beginnt mit... den ersten Löffelchen für Mami, Papi und den Rest der Welt. Ja, und dann? Was Hersteller von Babynahrung können, das ist oft im Handumdrehen auch selbst gemacht, vielleicht sogar gesünder, oftmals frischer. Ältere Babys und Schulkinder will das Kochbuch ansprechen und das tut es auf eine verspielte Art angenehm altersgemäß."

    converted_data = CsvToHash.convert(csv_data)
    expect(converted_data.size).to eq(2)
    expect(converted_data[0]["title"]).to eq("Ich helfe dir kochen. Das erfolgreiche Universalkochbuch mit großem Backteil")
    expect(converted_data[1]["title"]).to eq("Das große GU-Kochbuch Kochen für Kinder")
  end

end
