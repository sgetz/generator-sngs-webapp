"use strict"
util = require("util")
path = require("path")
yeoman = require("yeoman-generator")
yosay = require("yosay")
chalk = require("chalk")
SngsWebappGenerator = yeoman.generators.Base.extend {
	init: ->
		@pkg = require("../package.json")
		@on "end", ->
			@installDependencies()  unless @options["skip-install"]
			return

		return

	askFor: ->
		done = @async()
		
		propterFn = ({@appName, @addDemoSection, @someOption}) =>
			done()
			return
		
		# Have Yeoman greet the user.
		@log yosay("Welcome to the marvelous SngsWebapp generator!")
		prompts = [
			{
				name: 'appName'
				message: "What is your app's name ?"
			},
			{
				type: 'confirm'
				name: 'addDemoSection'
				message: 'Would you like to generate a demo section ?'
				default: true
			}
		]

		@prompt prompts, propterFn
		return

	app: ->
		@mkdir "app"
		@mkdir "app/templates"
		@copy "_package.json", "package.json"
		@copy "_bower.json", "bower.json"
		return

	projectfiles: ->
		@copy "editorconfig", ".editorconfig"
		@copy "jshintrc", ".jshintrc"
		return
	otherCoolThings: ->
		#Importing file-content as a string
		@readFileAsString path.join @sourceRoot(), 'bower.json' 
}
module.exports = SngsWebappGenerator