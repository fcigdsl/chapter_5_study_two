module DeterminingStandardAdultDosesOfArtDrugs
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.when_lopinavir_ritonavir_is_prescribed(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'Lopinavir/ritonavir', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('weight', '>=', '35', patient, 'kg') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '200/50', 'when lopinavir ritonavir is prescribed']
		actions << ['Frequency', 'Twice a day (BD)', 'when lopinavir ritonavir is prescribed']
	
		end
		actions
	end
				
		
	def self.when_stavudine_is_prescribed(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'd4T/3TC', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('weight', '>=', '25', patient, 'kg') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '30/150', 'when stavudine is prescribed']
		actions << ['Frequency', 'Twice a day (BD)', 'when stavudine is prescribed']
	
		end
		actions
	end
				
		
	def self.when_zidovudine_is_prescribed(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('ARVs', 'is', 'Zidovudine', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('weight', '>=', '25', patient, 'kg') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Dosage in mg', '300/150', 'when zidovudine is prescribed']
		actions << ['Frequency', 'Twice a day (BD)', 'when zidovudine is prescribed']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + when_lopinavir_ritonavir_is_prescribed(patient)
		alerts = alerts + when_stavudine_is_prescribed(patient)
		alerts = alerts + when_zidovudine_is_prescribed(patient)
		alerts
	end
end
