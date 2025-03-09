# encoding: UTF-8
require "spec_helper"

describe CLD do

  context "English text" do
    subject { CLD.detect_language("This is a test") }

    it { expect(subject[:name]).to eq("ENGLISH") }
    it { expect(subject[:code]).to eq("en") }
    it { expect(subject[:reliable]).to be true }
  end

  context "French text" do
    subject { CLD.detect_language("plus ça change, plus c'est la même chose") }

    it { expect(subject[:name]).to eq("FRENCH") }
    it { expect(subject[:code]).to eq("fr") }
    it { expect(subject[:reliable]).to be true }
  end

  context "Italian text" do
    subject { CLD.detect_language("sono tutti pazzi qui") }

    it { expect(subject[:name]).to eq("ITALIAN") }
    it { expect(subject[:code]).to eq("it") }
    it { expect(subject[:reliable]).to be true }
  end

  context "French in HTML - using CLD html " do
    subject { CLD.detect_language("<html><head><body><script>A large amount of english in the script which should be ignored if using html in detect_language.</script><p>plus ça change, plus c'est la même chose</p></body></html>", false) }

    it { expect(subject[:name]).to eq("FRENCH") }
    it { expect(subject[:code]).to eq("fr") }
  end

  context "French in HTML - using CLD text " do
    subject { CLD.detect_language("<html><head><body><script>A large amount of english in the script which should be ignored if using html in detect_language.</script><p>plus ça change, plus c'est la même chose</p></body></html>", true) }

    it { expect(subject[:name]).to eq("ENGLISH") }
    it { expect(subject[:code]).to eq("en") }
  end

  context "Simplified Chinese text" do
    subject { CLD.detect_language("你好吗箭体") }

    it { expect(subject[:name]).to eq("Chinese") }
    it { expect(subject[:code]).to eq("zh") }
  end

  context "Traditional Chinese text" do
    subject { CLD.detect_language("你好嗎繁體") }

    it { expect(subject[:name]).to eq("ChineseT") }
    it { expect(subject[:code]).to eq("zh-Hant") }
  end

  context "Unknown text" do
    subject { CLD.detect_language("") }

    it { expect(subject[:name]).to eq("Unknown") }
    it { expect(subject[:code]).to eq("un") }
    it { expect(subject[:reliable]).to_not be true }
  end

  context "nil for text" do
    subject { CLD.detect_language(nil) }

    it { expect(subject[:name]).to eq("Unknown") }
    it { expect(subject[:code]).to eq("un") }
    it { expect(subject[:reliable]).to_not be true }
  end

end
