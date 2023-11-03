class Ticket < ApplicationRecord
	has_one :excavator, dependent: :destroy
	validates :RequestNumber, presence: true
	
	def self.ticket_data(data)
		ticket_data = {
		request_number: data[:RequestNumber],
		sequence_number: data[:SequenceNumber],
		request_type: data[:RequestType],
		request_action: data[:RequestAction],
		response_due_date_time: data[:ResponseDueDateTime],
		primary_service_area_code: data[:ServiceArea][:PrimaryServiceAreaCode][:SACode],
		additional_service_area_codes: data[:ServiceArea][:AdditionalServiceAreaCodes][:SACode],
		well_known_text: data[:ExcavationInfo][:DigsiteInfo][:WellKnownText]
	}

	address = data[:ExcavationInfo][:DigsiteInfo][:AddressInfo]
	street_name = address[:Street].reject { |key, value| value.to_s.empty? }.values.join(",")
	address_data = street_name+", "+address[:Place]+", "+address[:State]+", "+address[:Zip]

	excavator_data = {
		company_name: data[:Excavator][:CompanyName],
		address: address_data,
		crew_on_site: data[:Excavator][:CrewOnsite],
	}

	return ticket_data,excavator_data
	end

	def excavator_data(data)

	end
end
