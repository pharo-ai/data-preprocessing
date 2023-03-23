"
I am a baseline to define the structure and dependencies of the AIDataPreProcessing project.
"
Class {
	#name : #BaselineOfAIDataPreProcessing,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIDataPreProcessing
}

{ #category : #baseline }
BaselineOfAIDataPreProcessing >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"
		"self dataFrame: spec."

		"Packages"
		spec
			package: 'AI-DataPreProcessing-Encoders';
			package: 'AI-DataPreProcessing-Encoders-Tests' with: [ spec requires: #( 'AI-DataPreProcessing-Encoders' ) ].

		"Groups"
		spec
			group: 'Core' with: #( 'AI-DataPreProcessing-Encoders' );
			group: 'Tests' with: #( 'AI-DataPreProcessing-Encoders-Tests' ) ]
]

{ #category : #dependencies }
BaselineOfAIDataPreProcessing >> dataFrame: spec [

	spec baseline: 'AIExternalDataFrame' with: [ spec repository: 'github://pharo-ai/external-dependencies' ]
]

{ #category : #accessing }
BaselineOfAIDataPreProcessing >> projectClass [
	^ MetacelloCypressBaselineProject
]
