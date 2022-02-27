class SJFModel {
  int atValue = 0;
  int cpuBurstValue = 0;
  int ioTime = 0;
  int cpu = 0;
  static bool ioSwitch = false;
  static List<SJFModel> tableListValue = [SJFModel(0, 0, 0, 0)];
  SJFModel(this.atValue, this.cpuBurstValue, this.ioTime, this.cpu);
}
