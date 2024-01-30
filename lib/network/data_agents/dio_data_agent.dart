import 'package:engineering_project/data/vos/material_request_store_vo.dart';
import 'package:engineering_project/data/vos/phase_task_report_vo.dart';
import 'package:engineering_project/data/vos/report_vo.dart';
import 'package:engineering_project/data/vos/request_maintenance_form_vo.dart';
import 'package:engineering_project/network/responses/get_delivery_order_response.dart';
import 'package:engineering_project/network/responses/get_product_for_site_response.dart';
import 'package:engineering_project/network/responses/get_product_list_response.dart';
import 'package:engineering_project/network/responses/get_project_phase_for_material_request_response.dart';
import 'package:engineering_project/network/responses/get_project_phases_by_employee_response.dart';
import 'package:engineering_project/network/responses/get_request_list_response.dart';
import 'package:engineering_project/network/responses/get_room_building_response.dart';
import 'package:engineering_project/network/responses/get_search_asset_response.dart';
import 'package:engineering_project/network/responses/post_login_response.dart';
import 'package:engineering_project/network/responses/get_request_report_response.dart';
import 'package:engineering_project/network/responses/get_product_data_response.dart';

import '../responses/get_asset_data_response.dart';
import '../responses/post_report_task_response.dart';

abstract class DioDataAgent {
  Future<PostLoginResponse> postUserLogin(String email, String password);
  Future<GetRequestListResponse> getRequestList();
  Future<GetRequestListResponse> getRequestListById(int employeeId);
  Future<GetProjectPhasesByEmployeeResponse> getProjectPhasesByEmployee(
      int employeeId);
  Future<GetAssetDataResponse> getAssetData(int id);
  Future<void> postReportRequest(ReportVO reportVO);
  Future<void> postReportTaskRequest(ReportVO reportVO);
  Future<GetProductListResponse> getProductList();
  Future<void> postMaterialRequestStore(
      MaterialRequestStoreVO materialRequestStoreVO);
  Future<GetProductDataResponse> getProductDataList();
  Future<GetRoomBuildingResponse> getRoomBuilding();
  Future<void> postMaintenanceRequestStore(RequestMaintenanceFormVO formVO);
  Future<GetProductForSiteInventoryResponse> getProductsForSite(int phaseId);
  Future<GetSearchAssetResponse> getSearchAssets();
  Future<GetMaintenanceReportList> getMaintenanceReportList(String employeeId);
  Future<List<PhaseTaskReportVO>> getPhaseTaskReportList(String employeeId);
  Future<GetProjectPhaseForMaterialRequestResponse>
      getProjectPhaseForMaterialRequest();
  Future<GetDeliveryOrderResponse> getDeliveryOrder();
  Future<void> postReceiveDeliOrder(int id);
}
