module ManagingSuspectedArtDrugFailure
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.presenting_with_new_stage_IV_condition(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('ART duration', '>=', '12', patient, 'months') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Adhering to therapy', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('New WHO stage III/VI condition', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Flag patient for', 'Suspected ART drug failure', 'presenting with new stage IV condition']
	
		end
		actions
	end
				
		
	def self.presenting_with_suspected_ART_drug_failure(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Suspected ART drug failure', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Adhering to therapy in last 6 months', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Refer to', 'Clinician', 'presenting with suspected ART drug failure']
		actions << ['Order', 'Viral load test', 'presenting with suspected ART drug failure']
	
		end
		actions
	end
				
		
	def self.presenting_with_suspected_ART_drug_failure_and_bad_adherence(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('On ART', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Suspected ART drug failure', 'is', 'present', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Adhering to therapy in last 6 months', 'is', 'No', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Enroll in program', 'Adherence support', 'presenting with suspected ART drug failure and bad adherence']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + presenting_with_new_stage_IV_condition(patient)
		alerts = alerts + presenting_with_suspected_ART_drug_failure(patient)
		alerts = alerts + presenting_with_suspected_ART_drug_failure_and_bad_adherence(patient)
		alerts
	end
end
