import com.vanniktech.maven.publish.JavadocJar
import com.vanniktech.maven.publish.KotlinJvm
import com.vanniktech.maven.publish.SourcesJar
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    kotlin("jvm") version "2.3.21"
    kotlin("plugin.serialization") version "2.3.21"
    `java-library`
    id("com.vanniktech.maven.publish") version "0.37.0"
}

group = "com.apollodeploy.signal"
version = "1.0.5"

repositories {
    mavenCentral()
}

configurations.all {
    resolutionStrategy.eachDependency {
        if (requested.group == "org.jetbrains.kotlin") {
            useVersion("2.3.21")
            because("Align all Kotlin stdlib/reflect artifacts to the compiler version")
        }
    }
}

dependencies {
    api(kotlin("stdlib"))
    api("org.jetbrains.kotlinx:kotlinx-serialization-json:1.11.0")
    api("io.ktor:ktor-client-core:3.5.0")

    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.11.0")
    implementation("io.ktor:ktor-client-cio:3.5.0")
    implementation("io.ktor:ktor-client-content-negotiation:3.5.0")
    implementation("io.ktor:ktor-serialization-kotlinx-json:3.5.0")

    testImplementation(kotlin("test"))
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.11.0")
}

kotlin {
    compilerOptions {
        jvmTarget.set(JvmTarget.fromTarget("21"))
    }
}

java {
    sourceCompatibility = JavaVersion.toVersion(21)
    targetCompatibility = JavaVersion.toVersion(21)
}

tasks.test {
    useJUnitPlatform()
}

mavenPublishing {
    coordinates("com.apollodeploy.signal", "signal-sdk-kotlin", project.version.toString())
    configure(
        KotlinJvm(
            javadocJar = JavadocJar.Empty(),
            sourcesJar = SourcesJar.Sources(),
        ),
    )
    publishToMavenCentral()
    signAllPublications()

    pom {
        name.set("Apollo Signal API")
        description.set("Generated Kotlin SDK for Apollo Signal API")

        providers.gradleProperty("pomUrl")
            .orElse(providers.environmentVariable("POM_URL"))
            .orNull
            ?.let { url.set(it) }

        licenses {
            license {
                name.set("MIT License")
                url.set("https://opensource.org/license/mit")
            }
        }

        val pomDeveloperId = providers.gradleProperty("pomDeveloperId")
            .orElse(providers.environmentVariable("POM_DEVELOPER_ID"))
            .orNull
        val pomDeveloperName = providers.gradleProperty("pomDeveloperName")
            .orElse(providers.environmentVariable("POM_DEVELOPER_NAME"))
            .orNull

        if (pomDeveloperId != null || pomDeveloperName != null) {
            developers {
                developer {
                    pomDeveloperId?.let { id.set(it) }
                    pomDeveloperName?.let { name.set(it) }
                }
            }
        }

        val pomScmUrl = providers.gradleProperty("pomScmUrl")
            .orElse(providers.environmentVariable("POM_SCM_URL"))
            .orNull
        val pomScmConnection = providers.gradleProperty("pomScmConnection")
            .orElse(providers.environmentVariable("POM_SCM_CONNECTION"))
            .orNull
        val pomScmDeveloperConnection = providers.gradleProperty("pomScmDeveloperConnection")
            .orElse(providers.environmentVariable("POM_SCM_DEVELOPER_CONNECTION"))
            .orNull

        if (pomScmUrl != null || pomScmConnection != null || pomScmDeveloperConnection != null) {
            scm {
                pomScmUrl?.let { url.set(it) }
                pomScmConnection?.let { connection.set(it) }
                pomScmDeveloperConnection?.let { developerConnection.set(it) }
            }
        }
    }
}
