/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Special : Codable {
	let discount_ratio : String?
	let original_price : String?
	let price_formated : String?
	let originalPriceWithoutCurrency : Double?
	let priceWithoutCurrency : Double?

	enum CodingKeys: String, CodingKey {

		case discount_ratio = "discount_ratio"
		case original_price = "original_price"
		case price_formated = "price_formated"
		case originalPriceWithoutCurrency = "originalPriceWithoutCurrency"
		case priceWithoutCurrency = "priceWithoutCurrency"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		discount_ratio = try values.decodeIfPresent(String.self, forKey: .discount_ratio)
		original_price = try values.decodeIfPresent(String.self, forKey: .original_price)
		price_formated = try values.decodeIfPresent(String.self, forKey: .price_formated)
		originalPriceWithoutCurrency = try values.decodeIfPresent(Double.self, forKey: .originalPriceWithoutCurrency)
		priceWithoutCurrency = try values.decodeIfPresent(Double.self, forKey: .priceWithoutCurrency)
	}

}