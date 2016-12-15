require 'spec_helper'

describe CaesarCipher do 
	describe ".encrypt" do
		it "Encrypts single word" do
			expect(CaesarCipher.encrypt("hello")).to eql ("khoor")
		end
		it "Maintains case of input" do
			expect(CaesarCipher.encrypt("Hello")).to eql ("Khoor")
		end
		it "Adjusts split to input value" do
			expect(CaesarCipher.encrypt("Hello", 1)).to eql ("Ifmmp")
		end
		it "Starts at 'a' when shifting 'z'" do
			expect(CaesarCipher.encrypt("xyz", 2)).to eql ("zab")
		end
		it "Starts at 'z' when negative shifting 'a'" do
			expect(CaesarCipher.encrypt("zab", -2)).to eql ("xyz")
		end
		it "Starts at 'A' when shifting 'Z'" do
			expect(CaesarCipher.encrypt("XYZ", 2)).to eql ("ZAB")
		end
		it "Starts at 'Z' when negative shifting 'A'" do
			expect(CaesarCipher.encrypt("ZAB", -2)).to eql ("XYZ")
		end
		it "Handles sentences, not shifting whitespace or punctuation" do
			expect(CaesarCipher.encrypt("It handles commas, sentences.", 11)).to eql ("Te slyowpd nzxxld, dpyepynpd.")
		end
	end
end