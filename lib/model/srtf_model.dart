class SRTFModel {
  int atValue = 0;
  int cpuBurstValue = 0;
  int ioTime = 0;
  int cpu = 0;
  static bool ioSwitch = false;
  static List<SRTFModel> tableListValue = [SRTFModel(0, 0, 0, 0)];
  SRTFModel(this.atValue, this.cpuBurstValue, this.ioTime, this.cpu);
}
