name := "exercises"

version := "1.0"

scalaVersion := "2.9.2"

libraryDependencies ++= Seq(
    "org.specs2" %% "specs2" % "1.12.4.1" % "test",
    "junit" % "junit" % "4.8.1" % "test",
    "org.scalatest" % "scalatest_2.9.2" % "2.0.M5" % "test"
)

// keep only specifications ending with Spec or Test
// testOptions := Seq(Tests.Filter(s => Seq("Spec", "Test").exists(s.endsWith(_))))
  
