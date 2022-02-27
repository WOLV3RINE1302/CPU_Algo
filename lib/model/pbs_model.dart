class PBSModel {
  int atValue = 0;
  int cpuBurstValue = 0;
  int ioTime = 0;
  int cpu = 0;
  static bool ioSwitch = false;
  static List<PBSModel> tableListValue = [PBSModel(0, 0, 0, 0)];
  PBSModel(this.atValue, this.cpuBurstValue, this.ioTime, this.cpu);
}
