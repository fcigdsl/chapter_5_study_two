module ImplementingCd4Monitoring
	include CoreService
	require 'bean'
	require 'json'
	require 'rest_client'                                                           
	require 'bigdecimal'

	def self.stopping_CD4_monitoring(patient)
		actions = []
		valid_condition = true
		
		#Evaluating conditions
		valid_condition = PatientService.evaluate_concept_condition('Eligible for ART', 'is', 'Yes', patient) unless !valid_condition
		
		
		if valid_condition
			actions = []
		
		actions << ['Stop all', 'CD4 monitoring', 'stopping CD4 monitoring']
	
		end
		actions
	end
				
		

	def self.guideline_recommendations(patient)
		alerts = []
		alerts = alerts + stopping_CD4_monitoring(patient)
		alerts
	end
end
