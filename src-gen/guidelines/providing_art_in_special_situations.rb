module ProvidingArtInSpecialSituations
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.born_to_HIV_positive_mother_on_ART(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Is mother on ART?', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '<', '72', patient, 'hours') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Prescribe', 'Standard ARV prophylaxis', 'born to HIV positive mother on ART']
	
		end
		actions
	end
				
		
	def self.HIV_with_renal_failure(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Renal failure', 'is', 'present', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Refer to other hospital', 'Tertiary hospital', 'HIV with renal failure']
		actions << ['Flag patient for', 'ART', 'HIV with renal failure']
	
		end
		actions
	end
				
		
	def self.severe_immuno_compromised_patients_on_TB(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('HIV test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('TB treatment phase', 'is', 'Initial', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('TB treatment phase duration', '<=', '2', patient, 'weeks') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Severe immuno-compromised', 'is', 'yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'ART', 'severe immuno compromised patients on TB']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + born_to_HIV_positive_mother_on_ART(patient)
		alerts = alerts + HIV_with_renal_failure(patient)
		alerts = alerts + severe_immuno_compromised_patients_on_TB(patient)
		alerts
	end
end
