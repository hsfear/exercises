name := "exercises"

version := "1.0"

scalaVersion := "2.10.0"

libraryDependencies ++= Seq(
    "org.specs2" %% "specs2" % "1.14" % "test",
    "junit" % "junit" % "4.8.1" % "test",
    "org.scalatest" % "scalatest_2.10" % "2.0.M5b" % "test"
)

// keep only specifications ending with Spec or Test
// testOptions := Seq(Tests.Filter(s => Seq("Spec", "Test").exists(s.endsWith(_))))
  
