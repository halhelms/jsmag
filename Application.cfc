<cfcomponent displayname="Application">
	<cfset this.name = "js-mag-articleaabcdaddaada">
	<cfset this.ormenabled = true>
	<cfset this.datasource = "jsmag">
	
	<cfset this.ormsettings.dbcreate = "update">
	<cfset this.ormsettings.dialect = "MySQL">
	<cfset this.ormsettings.cflocation = "models">
	

	<cffunction name="onApplicationStart">
		<cfinclude template="config/initialization.cfm">
	</cffunction>
	
	<cffunction name="onRequestStart">
		<cfif StructKeyExists( url, 'reload')>
			<cfset onApplicationStart()>
		</cfif>
	</cffunction>



</cfcomponent>