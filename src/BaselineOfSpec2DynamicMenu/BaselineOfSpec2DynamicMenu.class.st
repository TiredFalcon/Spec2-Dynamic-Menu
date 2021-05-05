Class {
	#name : #BaselineOfSpec2DynamicMenu,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpec2DynamicMenu
}

{ #category : #baselines }
BaselineOfSpec2DynamicMenu >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"Packages"
		spec
			package: 'My-Spec2-DynamicMenu'.
	].
]
