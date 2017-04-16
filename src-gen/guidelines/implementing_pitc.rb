module ImplementingPitc
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.patients_tested_over_3_months_ago(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV test result', 'is', 'negative', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV test result duration', '>', '3', patient, 'months') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Order', 'HIV test', 'patients tested over 3 months ago']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + patients_tested_over_3_months_ago(patient)
		alerts
	end
end
