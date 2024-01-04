/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Options : Codable {
	let option_id : Int?
	let product_option_id : Int?
	let type : String?
	let required : Int?
	let name : String?
	let en_name : String?
	let option_value : [Option_value]?

	enum CodingKeys: String, CodingKey {

		case option_id = "option_id"
		case product_option_id = "product_option_id"
		case type = "type"
		case required = "required"
		case name = "name"
		case en_name = "en_name"
		case option_value = "option_value"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		option_id = try values.decodeIfPresent(Int.self, forKey: .option_id)
		product_option_id = try values.decodeIfPresent(Int.self, forKey: .product_option_id)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		required = try values.decodeIfPresent(Int.self, forKey: .required)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		en_name = try values.decodeIfPresent(String.self, forKey: .en_name)
		option_value = try values.decodeIfPresent([Option_value].self, forKey: .option_value)
	}

}