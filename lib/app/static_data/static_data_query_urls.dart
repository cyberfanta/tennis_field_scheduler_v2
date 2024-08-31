const String baseUrl = "https://api.adminfyp.com";

const String organizationUrl = "$baseUrl/organization";
const String organizationGetAllUrl = "$organizationUrl/all";
const String organizationGetAllDeletedUrl = "$organizationUrl/all-deleted";

const String credentialsUrl = "$baseUrl/credentials";
const String credentialsGetAllUrl = "$credentialsUrl/all";
const String credentialsGetAllDeletedUrl = "$credentialsUrl/all-deleted";

const String flowFeedsUrl = "$baseUrl/flow-feed";
const String flowFeedsGetAllUrl = "$flowFeedsUrl/all";
const String flowFeedsGetAllDeletedUrl = "$flowFeedsUrl/all-deleted";

const String adminMediasUrl = "$baseUrl/admin-media";
const String adminMediasGetAllUrl = "$adminMediasUrl/all";
const String adminMediasGetAllDeletedUrl = "$adminMediasUrl/all-deleted";

const String adminJournalsUrl = "$baseUrl/admin-journal";
const String adminJournalsGetAllUrl = "$adminJournalsUrl/all";
const String adminJournalsGetAllDeletedUrl = "$adminJournalsUrl/all-deleted";

const String userMediasUrl = "$baseUrl/user-media";
const String userMediasGetAllUrl = "$userMediasUrl/all";
const String userMediasGetAllDeletedUrl = "$userMediasUrl/all-deleted";

const String userJournalsUrl = "$baseUrl/user-journal";
const String userJournalsGetAllUrl = "$userJournalsUrl/all";
const String userJournalsGetAllDeletedUrl = "$userJournalsUrl/all-deleted";

const String transcriptionUrl = "/transcription";

const String breathWorksUrl = "$baseUrl/achievement";
const String breathWorksGetAllUrl = "$breathWorksUrl/all";
const String breathWorksWithCredentialUrl = "$breathWorksUrl/<credential>/credentials2/<organizationId>";
const String markAsDoneUrl = "$breathWorksUrl/create-achievement-done";
