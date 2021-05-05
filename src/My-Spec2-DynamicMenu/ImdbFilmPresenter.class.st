Class {
	#name : #ImdbFilmPresenter,
	#superclass : #ImdbFilmComponent,
	#instVars : [
		'menuBar',
		'titleText',
		'isAvailableOnlineText',
		'yearText'
	],
	#category : #'My-Spec2-DynamicMenu'
}

{ #category : #initialization }
ImdbFilmPresenter >> initializePresenters [
	titleText := self newLabel.
	yearText := self newLabel.
	isAvailableOnlineText := self newLabel.
	
	menuBar := self menuBarFor: nil.
	
	self layout: (SpBoxLayout newVertical
		add: menuBar withConstraints: [ :constraints | constraints height: self class toolbarHeight ];
		add: (	SpGridLayout new
			add: 'Title' at: 1@1; add: titleText at: 2@1;
			add: 'Year' at: 1@2; add: yearText at: 2@2;
			add: 'Available online' at: 1@3; add: isAvailableOnlineText at: 2@3;
			yourself);
		yourself)
]

{ #category : #'private building' }
ImdbFilmPresenter >> menuBarFor: anImdbFilm [
	| aBar |
	aBar := self newMenuBar.
	anImdbFilm ifNil: [ ^ aBar ].
	
	aBar title: anImdbFilm title.
	aBar addItem: [ :item | item
		name: 'Inspect';
		action: [ anImdbFilm inspect ]. ].
	anImdbFilm isAvailableOnline ifTrue: [
		aBar addItem: [ :item | item
			name: 'See online';
			action: [ WebBrowser openOn: 'https://google.com?q=' , anImdbFilm title ]. ]. ].
	
	^ aBar.
]

{ #category : #initialization }
ImdbFilmPresenter >> setModel: anImdbFilm [
	| newMenuBar |
	titleText label: anImdbFilm title.
	yearText label: anImdbFilm year printString.
	isAvailableOnlineText label: anImdbFilm isAvailableOnline printString.
	
	newMenuBar := self menuBarFor: anImdbFilm.
	self layout replace: menuBar with: newMenuBar.
	menuBar := newMenuBar.
	
	self buildWithSpec.
	
]
