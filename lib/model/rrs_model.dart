class RRSModel {
  int atValue = 0;
  int cpuBurstValue = 0;
  int ioTime = 0;
  int cpu = 0;
  static bool ioSwitch = false;
  static List<RRSModel> tableListValue = [RRSModel(0, 0, 0, 0)];
  RRSModel(this.atValue, this.cpuBurstValue, this.ioTime, this.cpu);
}
