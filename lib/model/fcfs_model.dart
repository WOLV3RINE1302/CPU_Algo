class FCFSModel {
  int id = 0;
  int atValue = 0;
  int cpuBurstValue = 0;
  int ioTime = 0;
  int cpu = 0;
  static bool ioSwitch = false;
  static List<FCFSModel> tableListValue = [FCFSModel(0,0, 0, 0, 0)];
  FCFSModel(this.id, this.atValue, this.cpuBurstValue, this.ioTime, this.cpu);
}
