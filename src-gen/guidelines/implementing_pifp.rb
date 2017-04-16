module ImplementingPifp
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.routine_PIFP_in_women(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Gender', 'is', 'Female', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV test result', 'is', 'positive', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Prescribe', 'Depo-provera', 'routine PIFP in women']
		actions << ['Give patient', 'Condoms', 'routine PIFP in women']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + routine_PIFP_in_women(patient)
		alerts
	end
end
