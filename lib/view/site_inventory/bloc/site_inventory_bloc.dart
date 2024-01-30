import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/site_product_vo.dart';
import 'package:engineering_project/network/responses/get_project_phase_for_material_request_response.dart';
import 'package:flutter/foundation.dart';

class SiteInventoryBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<SiteProductVO?>? siteProductList = [];
  List<ProjectForMaterialRequestVO> projectList = [];
  List<String> projectNameList = [];
  int projectId = 0;
  List<PhaseForMaterialRequestVO> phaseList = [];
  List<String> phaseNameList = [];
  int phaseId = 0;
  String? selectedProjectName;
  String? selectedPhaseName;

  SiteInventoryBloc() {
    _showLoading();
    _repository.getProjectPhaseForMaterialRequest().then((value) {
      projectList = value.project ?? [];
      projectNameList = projectList.map((e) => e.name ?? "").toList();
      _notifySafely();
      _hideLoading();
    });
  }

  void onChooseProject(String projectName) {
    _showLoading();
    selectedProjectName = projectName;
    selectedPhaseName = null;
    siteProductList = [];
    var projects =
        projectList.where((element) => element.name == projectName).toList();
    projects.take(1);
    var project = projects.elementAt(0);
    projectId = project.id ?? 0;
    phaseList = project.phases ?? [];
    phaseNameList = phaseList.map((e) => e.phaseName ?? "").toList();
    _notifySafely();
    _hideLoading();
  }

  void onChoosePhase(String phaseName) {
    _showLoading();
    selectedPhaseName = phaseName;
    var phases =
        phaseList.where((element) => element.phaseName == phaseName).toList();
    phases.take(1);
    var phase = phases.elementAt(0);
    phaseId = phase.id ?? 0;
    siteProductList = [];
    _notifySafely();
    _repository.getProductsForSite(phaseId).then((response) {
      siteProductList = response.data;
      _notifySafely();
      _hideLoading();
    });
  }

  /// loading situations
  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
