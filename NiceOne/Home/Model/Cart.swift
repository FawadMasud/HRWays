/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Cart : Codable {
	let products : [Products]?
	let vouchers : [String]?
	let coupon_status : String?
	let coupon : String?
	let voucher_status : String?
	let voucher : String?
	let reward_status : Int?
	let reward : String?
	let totals : [Totals]?
	let offer : String?
	let offer_average : Int?
	let total : String?
	let total_raw : Double?
	let total_product_count : Int?

	enum CodingKeys: String, CodingKey {

		case products = "products"
		case vouchers = "vouchers"
		case coupon_status = "coupon_status"
		case coupon = "coupon"
		case voucher_status = "voucher_status"
		case voucher = "voucher"
		case reward_status = "reward_status"
		case reward = "reward"
		case totals = "totals"
		case offer = "offer"
		case offer_average = "offer_average"
		case total = "total"
		case total_raw = "total_raw"
		case total_product_count = "total_product_count"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		products = try values.decodeIfPresent([Products].self, forKey: .products)
		vouchers = try values.decodeIfPresent([String].self, forKey: .vouchers)
		coupon_status = try values.decodeIfPresent(String.self, forKey: .coupon_status)
		coupon = try values.decodeIfPresent(String.self, forKey: .coupon)
		voucher_status = try values.decodeIfPresent(String.self, forKey: .voucher_status)
		voucher = try values.decodeIfPresent(String.self, forKey: .voucher)
		reward_status = try values.decodeIfPresent(Int.self, forKey: .reward_status)
		reward = try values.decodeIfPresent(String.self, forKey: .reward)
		totals = try values.decodeIfPresent([Totals].self, forKey: .totals)
		offer = try values.decodeIfPresent(String.self, forKey: .offer)
		offer_average = try values.decodeIfPresent(Int.self, forKey: .offer_average)
		total = try values.decodeIfPresent(String.self, forKey: .total)
		total_raw = try values.decodeIfPresent(Double.self, forKey: .total_raw)
		total_product_count = try values.decodeIfPresent(Int.self, forKey: .total_product_count)
	}

}