module DeterminingArtEligibility
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.adult_patients_with_low_CD4_count(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('CD4 count', '<', '350', patient, 'cells/mm3') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'adult patients with low CD4 count']
	
		end
		actions
	end
				
		
	def self.children_with_mild_to_severe_HIV(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('WHO clinical stage paeds', 'is', 'WHO stage 3/4', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '24', patient, 'months') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '15', patient, 'years') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'children with mild to severe HIV']
	
		end
		actions
	end
				
		
	def self.ART_eligibility_in_PSHD_cryptococcal_meningitis(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Cryptococcal meningitis', 'is', 'Present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '12', patient, 'months') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'ART eligibility in PSHD cryptococcal meningitis']
	
		end
		actions
	end
				
		
	def self.positive_test_at_18_months(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '=', '18', patient, 'months') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Continue treatment', 'ART', 'positive test at 18 months']
	
		end
		actions
	end
				
		
	def self.older_children_with_low_CD4_count(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV rapid test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '24', patient, 'months') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '15', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('CD4 count', '<', '750', patient, 'cells/mm3') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'older children with low CD4 count']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + adult_patients_with_low_CD4_count(patient)
		alerts = alerts + children_with_mild_to_severe_HIV(patient)
		alerts = alerts + ART_eligibility_in_PSHD_cryptococcal_meningitis(patient)
		alerts = alerts + positive_test_at_18_months(patient)
		alerts = alerts + older_children_with_low_CD4_count(patient)
		alerts
	end
end
