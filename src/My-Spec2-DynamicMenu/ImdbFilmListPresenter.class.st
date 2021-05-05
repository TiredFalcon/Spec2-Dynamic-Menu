Class {
	#name : #ImdbFilmListPresenter,
	#superclass : #ImdbFilmComponent,
	#instVars : [
		'filmList',
		'detail'
	],
	#category : #'My-Spec2-DynamicMenu'
}

{ #category : #examples }
ImdbFilmListPresenter class >> openExample [
	<script>
	^ self new openWithSpec
]

{ #category : #initialization }
ImdbFilmListPresenter >> initializePresenters [
	filmList := self newTable
		addColumn: (SpStringTableColumn title: 'Title' evaluated: #title);
		addColumn: (SpStringTableColumn title: 'Year' evaluated: #year);
		addColumn: (SpStringTableColumn title: 'Available online' evaluated: #isAvailableOnline);
		yourself.
		
	detail := self instantiate: ImdbFilmPresenter.
	filmList whenSelectionChangedDo: [ :selectedItemMode |
		selectedItemMode isEmpty ifFalse: [
			detail setModel: selectedItemMode selectedItem ] ].
	
	self layout: (SpBoxLayout newTopToBottom
		add: filmList;
		add: detail;
		yourself).
		
	self updatePresenter.
]

{ #category : #initialization }
ImdbFilmListPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Mini IMDB';
		initialExtent: 600@400
]

{ #category : #initialization }
ImdbFilmListPresenter >> updatePresenter [
	filmList items: ImdbFilm films
]
