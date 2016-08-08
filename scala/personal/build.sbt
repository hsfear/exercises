name := "exercises"

version := "1.0"

scalaVersion := "2.11.7"

libraryDependencies ++= Seq(
    "org.specs2" %% "specs2-core" % "3.8.4" % "test",
    "org.specs2" % "specs2-junit_2.11" % "3.8.4"  ,
    "junit" % "junit" % "4.12" % "test",
    "org.scalactic" %% "scalactic" % "2.2.6",
    "org.scalatest" %% "scalatest" % "2.2.6" % "test"
)

// keep only specifications ending with Spec or Test
// testOptions := Seq(Tests.Filter(s => Seq("Spec", "Test").exists(s.endsWith(_))))
scalacOptions in Test ++= Seq("-Yrangepos") 
