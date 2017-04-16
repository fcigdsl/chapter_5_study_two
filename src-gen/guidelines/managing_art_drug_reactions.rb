module ManagingArtDrugReactions
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.presenting_with_yellow_fever(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Hepatitis', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'ARVs', 'presenting with yellow fever']
	
		end
		actions
	end
				
		
	def self.presenting_with_severe_stomach_pain(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Severe stomach pain', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'ARVs', 'presenting with severe stomach pain']
	
		end
		actions
	end
				
		
	def self.presenting_with_shortness_of_breath(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Shortness of breath', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'ARVs', 'presenting with shortness of breath']
	
		end
		actions
	end
				
		
	def self.presenting_with_severe_skin_rash(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Severe skin rash', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'ARVs', 'presenting with severe skin rash']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + presenting_with_yellow_fever(patient)
		alerts = alerts + presenting_with_severe_stomach_pain(patient)
		alerts = alerts + presenting_with_shortness_of_breath(patient)
		alerts = alerts + presenting_with_severe_skin_rash(patient)
		alerts
	end
end
