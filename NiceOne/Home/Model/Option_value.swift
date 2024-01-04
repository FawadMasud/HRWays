/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Option_value : Codable {
	let product_option_variant_id : Int?
	let quantity : Int?
	let image : String?
	let hex_color : String?
	let sku : String?
	let price : String?
	let price_formated : String?
	let event_price : String?
	let name : String?
	let en_name : String?

	enum CodingKeys: String, CodingKey {

		case product_option_variant_id = "product_option_variant_id"
		case quantity = "quantity"
		case image = "image"
		case hex_color = "hex_color"
		case sku = "sku"
		case price = "price"
		case price_formated = "price_formated"
		case event_price = "event_price"
		case name = "name"
		case en_name = "en_name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		product_option_variant_id = try values.decodeIfPresent(Int.self, forKey: .product_option_variant_id)
		quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		hex_color = try values.decodeIfPresent(String.self, forKey: .hex_color)
		sku = try values.decodeIfPresent(String.self, forKey: .sku)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		price_formated = try values.decodeIfPresent(String.self, forKey: .price_formated)
		event_price = try values.decodeIfPresent(String.self, forKey: .event_price)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		en_name = try values.decodeIfPresent(String.self, forKey: .en_name)
	}

}