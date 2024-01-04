/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Products : Codable {
	let id : String?
	let thumb : String?
	let price_formated : String?
	let priceWithoutCurrency : String?
	let price : String?
	let name : String?
	let en_name : String?
	let description : String?
	let sku : String?
	let isbn : String?
	let has_option : Bool?
	let category_id : Int?
	let quantity : Int?
	let special : [Special]
	let manufacturer : String?
	let is_new : Bool?
	let is_exclusive : Bool?
	let order : Int?
	let score : String?
	let event_price : String?
	let rating : Double?
	let total_reviews : String?
	let seo_url_ar : String?
	let seo_url_en : String?
	let share_url : String?
	let options : [Options]?
	let category_hierarchy : [Category_hierarchy]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case thumb = "thumb"
		case price_formated = "price_formated"
		case priceWithoutCurrency = "priceWithoutCurrency"
		case price = "price"
		case name = "name"
		case en_name = "en_name"
		case description = "description"
		case sku = "sku"
		case isbn = "isbn"
		case has_option = "has_option"
		case category_id = "category_id"
		case quantity = "quantity"
		case special = "special"
		case manufacturer = "manufacturer"
		case is_new = "is_new"
		case is_exclusive = "is_exclusive"
		case order = "order"
		case score = "score"
		case event_price = "event_price"
		case rating = "rating"
		case total_reviews = "total_reviews"
		case seo_url_ar = "seo_url_ar"
		case seo_url_en = "seo_url_en"
		case share_url = "share_url"
		case options = "options"
		case category_hierarchy = "category_hierarchy"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		thumb = try values.decodeIfPresent(String.self, forKey: .thumb)
		price_formated = try values.decodeIfPresent(String.self, forKey: .price_formated)
		priceWithoutCurrency = try values.decodeIfPresent(String.self, forKey: .priceWithoutCurrency)
		price = try values.decodeIfPresent(String.self, forKey: .price)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		en_name = try values.decodeIfPresent(String.self, forKey: .en_name)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		sku = try values.decodeIfPresent(String.self, forKey: .sku)
		isbn = try values.decodeIfPresent(String.self, forKey: .isbn)
		has_option = try values.decodeIfPresent(Bool.self, forKey: .has_option)
		category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
		quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        special = try values.decodeIfPresent([Special].self, forKey: .special)!
		manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
		is_new = try values.decodeIfPresent(Bool.self, forKey: .is_new)
		is_exclusive = try values.decodeIfPresent(Bool.self, forKey: .is_exclusive)
		order = try values.decodeIfPresent(Int.self, forKey: .order)
		score = try values.decodeIfPresent(String.self, forKey: .score)
		event_price = try values.decodeIfPresent(String.self, forKey: .event_price)
		rating = try values.decodeIfPresent(Double.self, forKey: .rating)
		total_reviews = try values.decodeIfPresent(String.self, forKey: .total_reviews)
		seo_url_ar = try values.decodeIfPresent(String.self, forKey: .seo_url_ar)
		seo_url_en = try values.decodeIfPresent(String.self, forKey: .seo_url_en)
		share_url = try values.decodeIfPresent(String.self, forKey: .share_url)
		options = try values.decodeIfPresent([Options].self, forKey: .options)
		category_hierarchy = try values.decodeIfPresent([Category_hierarchy].self, forKey: .category_hierarchy)
	}

}
