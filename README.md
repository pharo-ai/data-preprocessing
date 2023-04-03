# data-preprocessing

[![CI](https://github.com/pharo-ai/data-preprocessing/actions/workflows/ci.yml/badge.svg)](https://github.com/pharo-ai/data-preprocessing/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/data-preprocessing/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/data-preprocessing?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PharoAI/data-imputers/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)

Project including data pre-processing algo. We aim to include scaling, centering, normalization, binarization methods.

## How to install it?

To install the project, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'AIDataPreProcessing';
  repository: 'github://pharo-ai/data-preprocessing/src';
  load.
```

## How to depend on it?

If you want to add a dependency on this project to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'AIDataPreProcessing'
  with: [ spec repository: 'github://pharo-ai/data-preprocessing/src' ].
```

If you are new to baselines and Metacello, check out this wonderful [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## Quick Start

### Encoding

It is possible to encode a 2D collection with numerical categories easily like this:

```st
| collection |
collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	
AIOrdinalEncoder new
	fitAndTransform: collection.  "#(#(2 3) #(1 1) #(2 2))"
```

For more details check the documentation bellow.

## Encoding 

### Ordinal Encoder

`AIOrdinalEncoder` is a simple encoder whose responsibility is to associate a number to each unique value of a 2D collection. (Can be a DataFrame)

I can be fitted with a collection to compute the categories to use and then transform another collection (possibily the same one).
All values of the collection to transform must be present in the collection used to fit the datas or an AIMissingCategory exception will be raised.

I can be use like this:

```st
| collection |
collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	
AIOrdinalEncoder new
	fit: collection;
	transform: collection.  "#(#(2 3) #(1 1) #(2 2))"
```

Or

```st
| collection |
collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	
AIOrdinalEncoder new
	fitAndTransform: collection.  "#(#(2 3) #(1 1) #(2 2))"
```

I can also be used on a `DataFrame` in the same way:

```st
| collection |
collection := DataFrame withRows: #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	
AIOrdinalEncoder new
	fitAndTransform: collection.  "#(#(2 3) #(1 1) #(2 2))"
```

The user can also give directly the categories to use like this:

```st
| collection |
collection := #( #( 'Female' 3 ) #( 'Male' 1 ) #( 'Female' 2 ) ).
	
AIOrdinalEncoder new
	categories: #( #( 'Female' 'Male' ) #( 3 1 2 ) );
	transform: collection. 	"#(#(1 1) #(2 2) #(1 3))"
```

In that case, the index of each elements will be used as a category.