name := """akkademaid"""

version := "1.0"

scalaVersion := "2.11.7"

// Change this to another test framework if you prefer
libraryDependencies += "org.scalatest" %% "scalatest" % "2.2.4" % "test"

libraryDependencies ++= Seq(
  "com.syncthemall" % "boilerpipe" % "1.2.2",
  "com.akkademy-db" %% "akkademy-db" % "0.0.1-SNAPSHOT"
)

// Uncomment to use Akka
//libraryDependencies += "com.typesafe.akka" %% "akka-actor" % "2.3.11"

