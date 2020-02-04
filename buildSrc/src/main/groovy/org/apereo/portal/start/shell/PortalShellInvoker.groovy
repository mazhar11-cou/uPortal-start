package org.apereo.portal.start.shell

import org.gradle.api.Project

/**
 * This class knows how to invoke org.apereo.portal.shell.PortalShell within the overlays:uPortal
 * project.  (It can't do anything in any other project.)
 */
class PortalShellInvoker {

    void invoke(Project project, String scriptLocation, String... args) {
        File serverBase = project.rootProject.file(project.rootProject.ext['buildProperties'].getProperty('server.base'))
        File deployDir = new File (serverBase, "webapps/${project.name}")

        File libsDir = project.rootProject.file(project.rootProject.getProperty('libsDir'))
        libsDir.mkdirs()
        project.configurations.shell.files.each {
            project.ant.copy(todir: libsDir, file: it.absolutePath)
        }

        project.ant.setLifecycleLogLevel('INFO')
        project.ant.java(fork: true, failonerror: true, dir: project.rootProject.projectDir, classname: 'org.apereo.portal.shell.PortalShell') {
            classpath {
                pathelement(location: "${deployDir}/WEB-INF/classes")
                pathelement(location: "${deployDir}/WEB-INF/lib/*")
                pathelement(location: "${libsDir}/*")
            }
            sysproperty(key: 'portal.home', value: project.rootProject.ext['buildProperties'].getProperty('portal.home'))
            sysproperty(key: 'logback.configurationFile', value: 'command-line.logback.xml')
            sysproperty(key: 'java.awt.headless', value: 'true')
            arg(value: '-s')
            arg(value: scriptLocation)
            args.each {
                arg(value: it)
            }
        }
    }

    static String createGroovySafePath(String rawPath) {
        return rawPath.replaceAll('\\\\', '/')
    }

}
