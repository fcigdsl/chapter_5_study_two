module MonitoringNutritionalStatus
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.presenting_with_BMI_under_17(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Patient pregnant', 'is', 'No', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('age', '>=', '15', patient, 'years') unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('Enrolled in HCC', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('BMI', '<', '17', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Enroll in program', 'Therapeutic feeding', 'presenting with BMI under 17']
	
		end
		actions
	end
				
		
	def self.presenting_with_MUAC_under_22(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Patient pregnant', 'is', 'Yes', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('HIV test result', 'is', 'positive', patient) unless !valid_condition
		valid_condition = PatientService.evaluate_concept_condition('MUAC', '<', '22', patient, 'cm') unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Enroll in program', 'Therapeutic feeding', 'presenting with MUAC under 22']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + presenting_with_BMI_under_17(patient)
		alerts = alerts + presenting_with_MUAC_under_22(patient)
		alerts
	end
end
