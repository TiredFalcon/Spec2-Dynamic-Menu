Class {
	#name : #ImdbFilm,
	#superclass : #Object,
	#instVars : [
		'title',
		'year'
	],
	#category : #'My-Spec2-DynamicMenu'
}

{ #category : #defaults }
ImdbFilm class >> films [
	"Use static list, just for testing."
	^ OrderedCollection new
		add: (self new title: 'Cloud Atlas'; year: 2012);
		add: (self new title: 'Metropolis'; year: 1927);
		add: (self new title: 'Star Wars'; year: 1977);
		yourself.
]

{ #category : #testing }
ImdbFilm >> isAvailableOnline [
	^ self year > 1970
]

{ #category : #accessing }
ImdbFilm >> title [
	^ title
]

{ #category : #accessing }
ImdbFilm >> title: anObject [
	title := anObject
]

{ #category : #accessing }
ImdbFilm >> year [
	^ year
]

{ #category : #accessing }
ImdbFilm >> year: anObject [
	year := anObject
]
