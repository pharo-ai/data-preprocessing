"
I am a baseline to define the structure and dependencies of the AIDataPreProcessing project.
"
Class {
	#name : #BaselineOfAIDataPreProcessing,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIDataPreProcessing
}

{ #category : #baselines }
BaselineOfAIDataPreProcessing >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Dependencies"
		self dataFrame: spec.

		"Packages"
		spec
			package: 'AI-DataPreProcessing-Encoders';
			package: 'AI-DataPreProcessing-Encoders-Tests' with: [ spec requires: #( 'AI-DataPreProcessing-Encoders' ) ];
			package: 'AI-DataPreProcessing-Encoders-DataFrame-Tests' with: [ spec requires: #( 'AIExternalDataFrame' 'AI-DataPreProcessing-Encoders-Tests' ) ];

			package: 'AI-DataPreProcessing-Normalization';
			package: 'AI-DataPreProcessing-Normalization-Tests' with: [ spec requires: #( 'AI-DataPreProcessing-Normalization' ) ].

		"Groups"
		spec
			group: 'default' with: #( 'Core' 'Tests' );
			group: 'Core' with: #( 'AI-DataPreProcessing-Encoders' 'AI-DataPreProcessing-Normalization' );
			group: 'Encoders' with: #( 'AI-DataPreProcessing-Encoders' 'AI-DataPreProcessing-Encoders-Tests' );
			group: 'Normalizers' with: #( 'AI-DataPreProcessing-Normalization' );
			group: 'DataFrame' with: #( 'AI-DataPreProcessing-Encoders-DataFrame-Tests' 'AI-DataPreProcessing-Normalization-Tests' );
			group: 'Tests' with: #( 'AI-DataPreProcessing-Encoders-Tests' 'AI-DataPreProcessing-Normalization-Tests' ) ]
]

{ #category : #dependencies }
BaselineOfAIDataPreProcessing >> dataFrame: spec [

	spec baseline: 'AIExternalDataFrame' with: [ spec repository: 'github://pharo-ai/external-dependencies' ]
]

{ #category : #accessing }
BaselineOfAIDataPreProcessing >> projectClass [
	^ MetacelloCypressBaselineProject
]
