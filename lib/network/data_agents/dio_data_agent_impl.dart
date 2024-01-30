import 'package:dio/dio.dart';
import 'package:engineering_project/core/core_config/config_text.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/material_request_store_vo.dart';
import 'package:engineering_project/data/vos/phase_task_report_vo.dart';
import 'package:engineering_project/data/vos/report_vo.dart';
import 'package:engineering_project/data/vos/request_maintenance_form_vo.dart';
import 'package:engineering_project/network/api_service/api_constants.dart';
import 'package:engineering_project/network/api_service/service.dart';
import 'package:engineering_project/network/data_agents/dio_data_agent.dart';
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

class DioDataAgentImpl extends DioDataAgent {
  DioDataAgentImpl._internal();

  static final DioDataAgentImpl _singleton = DioDataAgentImpl._internal();

  factory DioDataAgentImpl() => _singleton;

  @override
  Future<PostLoginResponse> postUserLogin(String email, String password) async {
    var data = {"email": email, "password": password};
    var dio = DioUtil.getDio();
    try {
      final response = await dio.post(LOGIN_URL, data: data);
      if (response.statusCode == 200) {
        return PostLoginResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetRequestListResponse> getRequestListById(int employeeId) async {
    var data = {"employee_id": employeeId};
    var dio = DioUtil.getDio();
    try {
      final response = await dio.post(REQUEST_LIST_BY_ID_URL, data: data);
      if (response.statusCode == 200) {
        return GetRequestListResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetRequestListResponse> getRequestList() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(REQUEST_LIST_URL);
      if (response.statusCode == 200) {
        return GetRequestListResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetProductDataResponse> getProductDataList() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(REQUEST_PRODUCT_LIST_URL);
      if (response.statusCode == 200) {
        return GetProductDataResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetProjectPhasesByEmployeeResponse> getProjectPhasesByEmployee(
      int employeeId) async {
    var dio = DioUtil.getDio();
    try {
      final response =
          await dio.get("$PROJECT_LIST_BY_EMPLOYEE_ID_URL/$employeeId");
      if (response.statusCode == 200) {
        return GetProjectPhasesByEmployeeResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetAssetDataResponse> getAssetData(int id) async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get("$ASSET_URL/$id");
      if (response.statusCode == 200) {
        return GetAssetDataResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> postReportRequest(ReportVO reportVO) async {
    var dio = DioUtil.getDio();
    var data = reportVO.toJson();
    try {
      final response = await dio.post(REPORT_REQUEST_URL, data: data);
      if (response.statusCode == 201) {
        ///return GetMaintenanceReportList.fromJson(response.data);
        return Future.value();
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> postReportTaskRequest(ReportVO reportVO) async {
    var dio = DioUtil.getDio();
    var data = reportVO.toJson();
    try {
      final response = await dio.post(REPORT_TASK_URL, data: data);
      if (response.statusCode == 201) {
        ///return PostReportTaskResponseVO.fromJson(response.data);
        return Future.value();
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetProductListResponse> getProductList() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(PRODUCT_LIST_URL);
      if (response.statusCode == 200) {
        return GetProductListResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> postMaterialRequestStore(
      MaterialRequestStoreVO materialRequestStoreVO) async {
    var dio = DioUtil.getDio();
    var data = materialRequestStoreVO.toJson();
    try {
      final response = await dio.post(REQUEST_MATERIAL_STORE_URL, data: data);
      if (response.statusCode == 201) {
        Functions.toast(msg: "Request Success", status: true);
        return Future.value();
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetRoomBuildingResponse> getRoomBuilding() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(ROOM_BUILDING_URL);
      if (response.statusCode == 200) {
        return GetRoomBuildingResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> postMaintenanceRequestStore(
      RequestMaintenanceFormVO formVO) async {
    var dio = DioUtil.getDio();
    var data = formVO.toJson();
    try {
      final response = await dio.post(REQUEST_MAINTENANCE_FROM_URL, data: data);
      if (response.statusCode == 200) {
        Functions.toast(msg: "Request Success", status: true);
        return Future.value();
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetProductForSiteInventoryResponse> getProductsForSite(
      int phaseId) async {
    var dio = DioUtil.getDio();
    var data = {"phase_id": phaseId};
    try {
      final response = await dio.post(SITE_PRODUCT_LIST_URL, data: data);
      if (response.statusCode == 200) {
        return GetProductForSiteInventoryResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetSearchAssetResponse> getSearchAssets() async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get(GET_ALL_SEARCH_ASSET_URL);
      if (response.statusCode == 200) {
        return GetSearchAssetResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetMaintenanceReportList> getMaintenanceReportList(
      String employeeId) async {
    var dio = DioUtil.getDio();
    try {
      final response =
          await dio.get("$GET_MAINTENANCE_REPORT_LIST/$employeeId");
      if (response.statusCode == 200) {
        return GetMaintenanceReportList.fromJson(response.data);
      }
      Functions.toast(msg: "Dio2 Exception");
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      Functions.toast(msg: "Dio Exception");
      throw Exception(e.toString());
    } catch (e) {
      Functions.toast(msg: "Dio2 Exception");
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<PhaseTaskReportVO>> getPhaseTaskReportList(
      String employeeId) async {
    var dio = DioUtil.getDio();
    try {
      final response = await dio.get("$GET_PHASE_TASK_REPORT_LIST/$employeeId");
      if (response.statusCode == 200) {
        List<dynamic> list = response.data;
        List<PhaseTaskReportVO> reportList =
            list.map((e) => PhaseTaskReportVO.fromJson(e)).toList();
        return reportList;
      }
      Functions.toast(msg: "Throw Exception");
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      Functions.toast(msg: "Dio Exception");
      throw Exception(e.toString());
    } catch (e) {
      Functions.toast(msg: "Dio2 Exception");
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetProjectPhaseForMaterialRequestResponse>
      getProjectPhaseForMaterialRequest() async {
    final EngineeringRepository repository = EngineeringRepositoryImpl();
    var id = await repository.getInt(EMPLOYEE_ID);
    var dio = DioUtil.getDio();
    try {
      final response =
          await dio.get("$GET_PROJECT_PHASE_FOR_MATERIAL_REQUEST/$id");
      if (response.statusCode == 200) {
        return GetProjectPhaseForMaterialRequestResponse.fromJson(
            response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<GetDeliveryOrderResponse> getDeliveryOrder() async {
    var dio = DioUtil.getDio();
    final EngineeringRepository repository = EngineeringRepositoryImpl();
    var id = await repository.getInt(EMPLOYEE_ID);
    try {
      final response = await dio.get("$GET_DELIVERY_ORDER_URL/$id");
      if (response.statusCode == 200) {
        return GetDeliveryOrderResponse.fromJson(response.data);
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> postReceiveDeliOrder(int id) async {
    var dio = DioUtil.getDio();
    var data = {"delivery_order_id": id};
    try {
      final response = await dio.post(POST_DELIVERY_RECEIVE_URL, data: data);
      if (response.statusCode == 200) {
        return Future.value();
      }
      throw Exception('Failed to load response');
    } on DioException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
