name := "exercises"

version := "1.0"

scalaVersion := "2.10.0"

libraryDependencies ++= Seq(
    "org.specs2" %% "specs2" % "1.14" % "test",
    "junit" % "junit" % "4.8.1" % "test",
    "org.scalatest" % "scalatest_2.10.0" % "2.0.M5" % "test"
)

// keep only specifications ending with Spec or Unit
testOptions := Seq(Tests.Filter(s => Seq("Spec", "Test").exists(s.endsWith(_))))
  
