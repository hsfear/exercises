name := """akkademaid"""

version := "1.0"

scalaVersion := "2.11.7"

libraryDependencies ++= Seq(
  "com.syncthemall" % "boilerpipe" % "1.2.2",
  "com.akkademy-db" %% "akkademy-db" % "0.0.1-SNAPSHOT",
  "com.typesafe.akka" %% "akka-remote" % "2.3.11",
  "com.typesafe.akka" %% "akka-testkit" % "2.3.11" % "test",
  "org.scalatest"     %% "scalatest" % "2.2.4" % "test"
)

// Uncomment to use Akka
//libraryDependencies += "com.typesafe.akka" %% "akka-actor" % "2.3.11"

