#!/usr/bin/env groovy
import groovy.json.JsonOutput

String nombrePod = "${JOB_NAME}".replaceAll("/", "-") + "-pipeline";

podTemplate(
	label: nombrePod,
	inheritFrom: 'default',
	containers: [
        containerTemplate(name: 'docker', image:'docker:18.05', command: 'cat', ttyEnabled: true)
    ],
	volumes: [
	hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
	hostPathVolume(mountPath: '/root/.npmrc', hostPath: '/home/.npmrc')
]
) {
	node(nombrePod) {

		stage('Descargando código') {
			checkOutConTags();
		}

        stage('Calculando version') {
            nuevaVersion = calcularVersion()
        }

        container('docker') {
            stage('Creando docker(s)') {
                if (argumentosCompilacion.size() == 0) {
                crearDockerImage(nuevaVersion)
                } else {
                argumentosCompilacion.each{
                    sh ("mv \"dist_${it.nombre}\" dist")
                    crearDockerImage(nuevaVersion, it.nombre)
                    sh ("mv dist \"dist_${it.nombre}\"")
                }
                }
            }
        }
        
        stage('Nueva versión') {
            crearVersion(nuevaVersion);
        }
	}

} 
