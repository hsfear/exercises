object SpaceAge {
  def onNeptune(d: Double): Double = onEarth(d) / 164.79132

  def onUranus(d: Double): Double = onEarth(d) / 84.016846

  def onSaturn(d: Double): Double = onEarth(d) / 29.447498

  def onJupiter(d: Double): Double = onEarth(d) / 11.862615

  def onMars(d: Double): Double = onEarth(d) / 1.8808158

  def onVenus(d: Double): Double = onEarth(d) / 0.61519726

  def onMercury(d: Double): Double = onEarth(d) / 0.2408467

  def onEarth(d: Double): Double = d / 31557600

}
