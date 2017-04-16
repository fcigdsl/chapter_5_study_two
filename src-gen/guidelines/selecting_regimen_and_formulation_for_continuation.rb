module SelectingRegimenAndFormulationForContinuation
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.switching_to_adult_firstline_when_over_25_kg(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '15', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'Regimen 0P', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Weight', '>', '25', patient, 'kg') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Prescribe drugs', 'Regimen 0A', 'switching to adult firstline when over 25 kg']
	
		end
		actions
	end
				
		
	def self.pregnant_women_on_EFV(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Patient pregnant', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'EFV-based regimen', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Continue', 'EFV-based regimen', 'pregnant women on EFV']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + switching_to_adult_firstline_when_over_25_kg(patient)
		alerts = alerts + pregnant_women_on_EFV(patient)
		alerts
	end
end
