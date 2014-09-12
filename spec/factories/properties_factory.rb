FactoryGirl.define do

  factory :makers_academy, class: Property do
    title		 		'Great flat near old street'
    address 		'25 city road'
    city 				'London'
    postcode	 	'EC1Y 1AA'
    description 'Makers Academy'
    id          '21'
  end

  factory :london_victoria, class: Property do
    title		 		'London Victoria'
    address 		'Victoria St'
    city 				'London'
    postcode 		'SW1E 5ND'
    description 'London vistoria train station'
  end

end