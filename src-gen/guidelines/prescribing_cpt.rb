module PrescribingCpt
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.dosing_for_younger_children(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Eligible for CPT', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('weight', '>=', '6', patient, 'kg') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('weight', '<=', '13.9', patient, 'kg') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '120', 'dosing for younger children']
	
		end
		actions
	end
				
		
	def self.dosing_for_older_children(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Eligible for CPT', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('weight', '>=', '14', patient, 'kg') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('weight', '<=', '29.9', patient, 'kg') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '480', 'dosing for older children']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + dosing_for_younger_children(patient)
		alerts = alerts + dosing_for_older_children(patient)
		alerts
	end
end
