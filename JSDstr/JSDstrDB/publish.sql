/****** Object:  ForeignKey [FK__aspnet_Me__Appli__21B6055D]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__Appli__21B6055D]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__Appli__21B6055D]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__22AA2996]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__UserI__22AA2996]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__UserI__22AA2996]
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__5AEE82B9]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pa__Appli__5AEE82B9]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]'))
ALTER TABLE [dbo].[aspnet_Paths] DROP CONSTRAINT [FK__aspnet_Pa__Appli__5AEE82B9]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__628FA481]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__628FA481]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]'))
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] DROP CONSTRAINT [FK__aspnet_Pe__PathI__628FA481]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__68487DD7]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__68487DD7]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__PathI__68487DD7]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__693CA210]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__UserI__693CA210]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__UserI__693CA210]
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__38996AB5]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pr__UserI__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]'))
ALTER TABLE [dbo].[aspnet_Profile] DROP CONSTRAINT [FK__aspnet_Pr__UserI__38996AB5]
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__440B1D61]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Ro__Appli__440B1D61]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]'))
ALTER TABLE [dbo].[aspnet_Roles] DROP CONSTRAINT [FK__aspnet_Ro__Appli__440B1D61]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__0DAF0CB0]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__Appli__0DAF0CB0]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [FK__aspnet_Us__Appli__0DAF0CB0]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__4AB81AF0]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__RoleI__4AB81AF0]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__RoleI__4AB81AF0]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__49C3F6B7]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__UserI__49C3F6B7]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__UserI__49C3F6B7]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_DeleteProfiles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetProfiles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetProperties]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Profile_GetProperties]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_SetProperties]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Profile_SetProperties]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_GetPageSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_SetPageSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_DeleteAllState]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_FindState]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_GetCountOfState]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_ResetSharedState]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_ResetUserState]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_AnyDataInTables]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_AnyDataInTables]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_CreateUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_CreateUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_FindUsersByEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_FindUsersByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetAllUsers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetNumberOfUsersOnline]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_GetPassword]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetPasswordWithFormat]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByUserId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_ResetPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_SetPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_SetPassword]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UnlockUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UpdateUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UpdateUserInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_DeleteRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users_DeleteUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Users_DeleteUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_AddUsersToRoles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_FindUsersInRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_GetRolesForUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_GetUsersInRoles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_IsUserInRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_MembershipUsers]'))
DROP VIEW [dbo].[vw_aspnet_MembershipUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Profiles]'))
DROP VIEW [dbo].[vw_aspnet_Profiles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_DeleteInactiveProfiles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_UsersInRoles]'))
DROP VIEW [dbo].[vw_aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_Shared]'))
DROP VIEW [dbo].[vw_aspnet_WebPartState_Shared]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_User]'))
DROP VIEW [dbo].[vw_aspnet_WebPartState_User]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_Paths]'))
DROP VIEW [dbo].[vw_aspnet_WebPartState_Paths]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_CreateRole]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Roles_CreateRole]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Roles]'))
DROP VIEW [dbo].[vw_aspnet_Roles]
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Users]'))
DROP VIEW [dbo].[vw_aspnet_Users]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_GetAllRoles]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Roles_GetAllRoles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_RoleExists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Roles_RoleExists]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users_CreateUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Users_CreateUser]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths_CreatePath]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Paths_CreatePath]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Membership]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Profile]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_RegisterSchemaVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Roles]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Personalization_GetApplicationId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Paths]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications_CreateApplication]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_CheckSchemaVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UnRegisterSchemaVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Users]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_WebEvent_LogEvent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Applications]'))
DROP VIEW [dbo].[vw_aspnet_Applications]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
DROP TABLE [dbo].[Session]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Settings]') AND type in (N'U'))
DROP TABLE [dbo].[Settings]
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_SchemaVersions]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_SchemaVersions]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Setup_RemoveAllRoleMembers]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Setup_RestorePermissions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_WebEvent_Events]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_WebEvent_Events]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]') AND type in (N'U'))
DROP TABLE [dbo].[aspnet_Applications]
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__08EA5793]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Ap__Appli__08EA5793]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Ap__Appli__08EA5793]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Applications] DROP CONSTRAINT [DF__aspnet_Ap__Appli__08EA5793]
END


End
GO
/****** Object:  Default [DF__aspnet_Me__Passw__239E4DCF]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Me__Passw__239E4DCF]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Me__Passw__239E4DCF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [DF__aspnet_Me__Passw__239E4DCF]
END


End
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__5BE2A6F2]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Pa__PathI__5BE2A6F2]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Pa__PathI__5BE2A6F2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Paths] DROP CONSTRAINT [DF__aspnet_Pa__PathI__5BE2A6F2]
END


End
GO
/****** Object:  Default [DF__aspnet_Perso__Id__6754599E]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Perso__Id__6754599E]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Perso__Id__6754599E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [DF__aspnet_Perso__Id__6754599E]
END


End
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__44FF419A]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Ro__RoleI__44FF419A]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Ro__RoleI__44FF419A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Roles] DROP CONSTRAINT [DF__aspnet_Ro__RoleI__44FF419A]
END


End
GO
/****** Object:  Default [DF__aspnet_Us__UserI__0EA330E9]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__UserI__0EA330E9]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Us__UserI__0EA330E9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [DF__aspnet_Us__UserI__0EA330E9]
END


End
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__0F975522]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__Mobil__0F975522]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Us__Mobil__0F975522]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [DF__aspnet_Us__Mobil__0F975522]
END


End
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__108B795B]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__IsAno__108B795B]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Us__IsAno__108B795B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [DF__aspnet_Us__IsAno__108B795B]
END


End
GO
/****** Object:  Default [DF__Session__Created__1EA48E88]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Session__Created__1EA48E88]') AND parent_object_id = OBJECT_ID(N'[dbo].[Session]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Session__Created__1EA48E88]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [DF__Session__Created__1EA48E88]
END


End
GO
/****** Object:  Default [DF__Session__Changed__1F98B2C1]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Session__Changed__1F98B2C1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Session]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Session__Changed__1F98B2C1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Session] DROP CONSTRAINT [DF__Session__Changed__1F98B2C1]
END


End
GO
/****** Object:  Default [DF__Settings__Create__00200768]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Settings__Create__00200768]') AND parent_object_id = OBJECT_ID(N'[dbo].[Settings]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Settings__Create__00200768]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Settings] DROP CONSTRAINT [DF__Settings__Create__00200768]
END


End
GO
/****** Object:  Default [DF__Settings__Change__01142BA1]    Script Date: 09/03/2013 15:42:20 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Settings__Change__01142BA1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Settings]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Settings__Change__01142BA1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Settings] DROP CONSTRAINT [DF__Settings__Change__01142BA1]
END


End
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_BasicAccess')
DROP SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_FullAccess')
DROP SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_ReportingAccess')
DROP SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_BasicAccess')
DROP SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_FullAccess')
DROP SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_ReportingAccess')
DROP SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_BasicAccess')
DROP SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_FullAccess')
DROP SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_ReportingAccess')
DROP SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_BasicAccess')
DROP SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_FullAccess')
DROP SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_ReportingAccess')
DROP SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_WebEvent_FullAccess')
DROP SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Membership_BasicAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_BasicAccess' AND type = 'R')
DROP ROLE [aspnet_Membership_BasicAccess]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Membership_FullAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_FullAccess' AND type = 'R')
DROP ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Membership_ReportingAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_ReportingAccess' AND type = 'R')
DROP ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Personalization_BasicAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_BasicAccess' AND type = 'R')
DROP ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Personalization_FullAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_FullAccess' AND type = 'R')
DROP ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Personalization_ReportingAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_ReportingAccess' AND type = 'R')
DROP ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Profile_BasicAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_BasicAccess' AND type = 'R')
DROP ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Profile_FullAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_FullAccess' AND type = 'R')
DROP ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Profile_ReportingAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_ReportingAccess' AND type = 'R')
DROP ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Roles_BasicAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_BasicAccess' AND type = 'R')
DROP ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Roles_FullAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_FullAccess' AND type = 'R')
DROP ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_Roles_ReportingAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_ReportingAccess' AND type = 'R')
DROP ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 09/03/2013 15:42:20 ******/
DECLARE @RoleName sysname
set @RoleName = N'aspnet_WebEvent_FullAccess'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_WebEvent_FullAccess' AND type = 'R')
DROP ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_BasicAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_FullAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_ReportingAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_BasicAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_FullAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_ReportingAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_BasicAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_FullAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_ReportingAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_BasicAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_FullAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_ReportingAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_WebEvent_FullAccess')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_WebEvent_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]

END
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]'
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]'
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]'
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]'
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]'
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]'
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]'
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]'
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]'
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]'
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]'
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]'
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 09/03/2013 15:42:21 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_WebEvent_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]'
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) COLLATE Ukrainian_CI_AS NOT NULL,
	[LoweredApplicationName] [nvarchar](256) COLLATE Ukrainian_CI_AS NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) COLLATE Ukrainian_CI_AS NULL,
 CONSTRAINT [PK__aspnet_A__C93A4C98014935CB] PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [UQ__aspnet_A__17477DE40425A276] UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [UQ__aspnet_A__3091033107020F21] UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]') AND name = N'aspnet_Applications_Index')
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', N'd80745d1-d1f7-4811-98a2-e8064d8b8959', NULL)
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_WebEvent_Events]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) COLLATE Ukrainian_CI_AS NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) COLLATE Ukrainian_CI_AS NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) COLLATE Ukrainian_CI_AS NULL,
	[ApplicationPath] [nvarchar](256) COLLATE Ukrainian_CI_AS NULL,
	[ApplicationVirtualPath] [nvarchar](256) COLLATE Ukrainian_CI_AS NULL,
	[MachineName] [nvarchar](256) COLLATE Ukrainian_CI_AS NOT NULL,
	[RequestUrl] [nvarchar](1024) COLLATE Ukrainian_CI_AS NULL,
	[ExceptionType] [nvarchar](256) COLLATE Ukrainian_CI_AS NULL,
	[Details] [ntext] COLLATE Ukrainian_CI_AS NULL,
 CONSTRAINT [PK__aspnet_W__7944C810797309D9] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Setup_RestorePermissions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + '' '' + @action + '' on '' + @object + '' TO ['' + @grantee + '']''
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Setup_RemoveAllRoleMembers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = ''EXEC sp_droprolemember '' + '''''''' + @name + '''''', '''''' + USER_NAME(@user_id) + ''''''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_SchemaVersions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) COLLATE Ukrainian_CI_AS NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) COLLATE Ukrainian_CI_AS NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
 CONSTRAINT [PK__aspnet_S__5A1E6BC11367E606] PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[Settings]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Settings]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ChangedDate] [datetime] NULL,
	[Key] [nvarchar](max) COLLATE Ukrainian_CI_AS NOT NULL,
	[Value] [nvarchar](max) COLLATE Ukrainian_CI_AS NOT NULL,
 CONSTRAINT [PK__Settings__3214EC077E37BEF6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Settings] ON
INSERT [dbo].[Settings] ([Id], [CreatedDate], [ChangedDate], [Key], [Value]) VALUES (1, CAST(0x0000A231011A3BCB AS DateTime), CAST(0x0000A231011A3C70 AS DateTime), N'AnonymUsersCount', N'34')
SET IDENTITY_INSERT [dbo].[Settings] OFF
/****** Object:  Table [dbo].[Session]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Session](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ChangedDate] [datetime] NULL,
	[Guid] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](max) COLLATE Ukrainian_CI_AS NOT NULL,
	[State] [int] NOT NULL,
	[StateMessage] [nvarchar](max) COLLATE Ukrainian_CI_AS NULL,
	[DataId] [int] NULL,
	[ResultId] [int] NULL,
	[StatisticsId] [int] NULL,
 CONSTRAINT [PK__Session__3214EC071CBC4616] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Session] ON
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (1, CAST(0x0000A26B00EA3BCD AS DateTime), CAST(0x0000A26B00EA5733 AS DateTime), N'14cebda2-e33e-4ebe-8bef-db2eaccce430', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (2, CAST(0x0000A26B00EA4339 AS DateTime), CAST(0x0000A26B00EA9E4A AS DateTime), N'6922c5e3-d6ef-4bf6-b4a4-b5aa6fe4064f', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (3, CAST(0x0000A26B00EA573D AS DateTime), CAST(0x0000A26B00EA629D AS DateTime), N'9ced6c4c-97d1-4d9e-b678-04a3082cf20d', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (4, CAST(0x0000A26B00EA9E52 AS DateTime), CAST(0x0000A26B00EACE11 AS DateTime), N'09c0cb77-8644-4141-a9c9-c60261be3dd6', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (5, CAST(0x0000A26B00EB088B AS DateTime), CAST(0x0000A26B00F0534C AS DateTime), N'c244cc83-25bb-47c7-b619-13f5eeaaecad', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (6, CAST(0x0000A26B00F05355 AS DateTime), CAST(0x0000A26B00F080F9 AS DateTime), N'dc3e62bf-6acf-46ee-afb7-6f58e77412a8', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (7, CAST(0x0000A26B00F08101 AS DateTime), CAST(0x0000A26B00F08865 AS DateTime), N'77291754-9649-434c-8a7b-8678776257e3', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (8, CAST(0x0000A26B00F0BAF1 AS DateTime), CAST(0x0000A26B00F30F83 AS DateTime), N'a1f61c49-4989-4d88-868d-ead92236a93a', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (9, CAST(0x0000A26B00F314A4 AS DateTime), CAST(0x0000A26B00F349BA AS DateTime), N'cfc5b6ec-0fda-4c5c-9eea-9e20449d1d3d', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (10, CAST(0x0000A26B00F37C33 AS DateTime), CAST(0x0000A26B00F3AADC AS DateTime), N'ae20c9a2-77b6-4984-8e32-e085839614e6', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (11, CAST(0x0000A26B00F3AB3E AS DateTime), CAST(0x0000A26B00F41D97 AS DateTime), N'8be03e91-4d22-4d8f-a9b7-14d71a3de0e5', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (12, CAST(0x0000A26B00F41D9C AS DateTime), CAST(0x0000A26B00F42606 AS DateTime), N'795aac32-94bf-485e-9f25-31bc32a2534b', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (13, CAST(0x0000A26B00F4290E AS DateTime), CAST(0x0000A26B00F42BD5 AS DateTime), N'53112354-3ddf-4903-a7bb-730b14caf991', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (14, CAST(0x0000A26B00F42EBD AS DateTime), CAST(0x0000A26B00F434E1 AS DateTime), N'20cefeaa-c430-40eb-8895-ec21f2fb406a', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (15, CAST(0x0000A26B00F4381A AS DateTime), CAST(0x0000A26B00F4F898 AS DateTime), N'3008e4f4-726e-4a28-9f4d-1208900dd5e8', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (16, CAST(0x0000A26B00F4FAC9 AS DateTime), CAST(0x0000A26B00F9668D AS DateTime), N'63642139-559e-44ee-94bc-ddb0295702c0', N'anonym.24@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (17, CAST(0x0000A26B00F966A5 AS DateTime), CAST(0x0000A26B00F97997 AS DateTime), N'2de53747-928b-4f95-8f84-dce0332a0f1a', N'anonym.25@jsdstr.com', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (18, CAST(0x0000A22D0122124C AS DateTime), CAST(0x0000A22D01221850 AS DateTime), N'5745a723-baa0-4897-bb6c-de8aa79acd5e', N'anonym.25@jsdstr.com', 2, N'Ping at 02.09.2013 17:36:12 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (19, CAST(0x0000A22D0122C279 AS DateTime), CAST(0x0000A22D01234FE1 AS DateTime), N'4e5e5082-8a27-46eb-9842-378fe37b6cdf', N'anonym.25@jsdstr.com', 2, N'Created at 02.09.2013 17:38:37 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (20, CAST(0x0000A22D01234FE6 AS DateTime), CAST(0x0000A22D01235575 AS DateTime), N'c5adbb17-48c9-4357-8fe2-f1ccf49f5acb', N'anonym.25@jsdstr.com', 2, N'Cancel session at 02.09.2013 17:40:42 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (21, CAST(0x0000A22D012656C2 AS DateTime), CAST(0x0000A22D0126FED8 AS DateTime), N'75d2423f-a9c6-4d7e-a973-7696cdf65244', N'anonym.25@jsdstr.com', 2, N'Ping at 02.09.2013 17:54:02 failed. Invalid session state. Client: Started, Server: Stopped', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (22, CAST(0x0000A22D01270599 AS DateTime), CAST(0x0000A22D01280587 AS DateTime), N'07d971e0-2372-47d0-be27-fa6ec14d9949', N'anonym.25@jsdstr.com', 2, N'Ping at 02.09.2013 17:57:46 failed. Invalid session state. Client: Started, Server: Stopped', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (23, CAST(0x0000A22D01280A22 AS DateTime), CAST(0x0000A22D01283C6D AS DateTime), N'e6841a59-e79f-40b1-9b9f-01ba3a0fbb03', N'anonym.25@jsdstr.com', 2, N'Cancel session at 02.09.2013 17:58:33 failed. Invalid session state. Client: Started, Server: Stopped', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (24, CAST(0x0000A22D012873B3 AS DateTime), CAST(0x0000A22D012887CF AS DateTime), N'3366d5ab-d93c-4941-8841-660e78c53732', N'anonym.25@jsdstr.com', 2, N'Ping at 02.09.2013 17:59:37 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (25, CAST(0x0000A22D0128A9B7 AS DateTime), CAST(0x0000A22D0129F0B4 AS DateTime), N'dfc056e4-e114-41e4-8f66-2353110629a5', N'anonym.25@jsdstr.com', 2, N'Ping at 02.09.2013 18:01:35 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (26, CAST(0x0000A22D0129F0BC AS DateTime), CAST(0x0000A26B012CAA5B AS DateTime), N'817aabfe-0f6a-4837-ad66-365e86bc4443', N'anonym.25@jsdstr.com', 2, N'Ping at 02.09.2013 18:04:49 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (27, CAST(0x0000A26B012CAABE AS DateTime), CAST(0x0000A26B012CB8D5 AS DateTime), N'b1874919-470d-4c78-ac4a-04e22ad01ff2', N'anonym.26@jsdstr.com', 2, N'Cancel session at 03.11.2013 18:14:53 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (28, CAST(0x0000A26B012DDDDB AS DateTime), CAST(0x0000A26B012DE1AD AS DateTime), N'489e1cce-7a52-45ee-b139-a38cafaca1bf', N'anonym.26@jsdstr.com', 2, N'Cancel session at 03.11.2013 18:19:07 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (29, CAST(0x0000A26B012E5776 AS DateTime), CAST(0x0000A26B012E7712 AS DateTime), N'd89e3381-1159-4471-a8c6-726919a53cfd', N'anonym.26@jsdstr.com', 2, N'Ping at 03.11.2013 18:20:55 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (30, CAST(0x0000A26B012E7781 AS DateTime), CAST(0x0000A26B012EDCE4 AS DateTime), N'e0f50631-39c0-473e-a2c1-b3785eb7be4b', N'anonym.26@jsdstr.com', 2, N'Ping at 03.11.2013 18:21:38 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (31, CAST(0x0000A26B012E993B AS DateTime), CAST(0x0000A26B012EDCE4 AS DateTime), N'1f549536-247d-4b06-bd9a-eb929130be72', N'anonym.26@jsdstr.com', 2, N'Ping at 03.11.2013 18:21:50 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (32, CAST(0x0000A26B012EDCF0 AS DateTime), CAST(0x0000A26B012EF58B AS DateTime), N'89f070f8-6da1-447f-937b-248291305740', N'anonym.26@jsdstr.com', 2, N'Cancel session at 03.11.2013 18:23:02 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (33, CAST(0x0000A26B012EFC6E AS DateTime), CAST(0x0000A26B012EFDCB AS DateTime), N'f2f74371-0fd6-4feb-b381-690a97f9a184', N'anonym.26@jsdstr.com', 1, N'Ping at 03.11.2013 18:23:09 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (34, CAST(0x0000A22D01321821 AS DateTime), CAST(0x0000A22D01321F26 AS DateTime), N'5e126436-cb7d-41ad-a3ac-9719102d7bba', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 18:34:33 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (35, CAST(0x0000A22D01322117 AS DateTime), CAST(0x0000A22D01324282 AS DateTime), N'4cdeac2a-d2f5-4312-8880-a1bc4c570858', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 18:35:03 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (36, CAST(0x0000A22D0132DFFB AS DateTime), CAST(0x0000A22D0132E0E4 AS DateTime), N'4627a83d-d425-4039-ae82-1748da88f0c1', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 18:37:18 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (37, CAST(0x0000A22D0137A00F AS DateTime), CAST(0x0000A22D0137A895 AS DateTime), N'540f4819-2614-48ca-a871-d830670fcd29', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 18:54:42 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (38, CAST(0x0000A22D0137AA38 AS DateTime), CAST(0x0000A22D0137AB50 AS DateTime), N'f9fd68b7-c5a4-4bad-a52e-bfa0959413b8', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 18:54:45 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (39, CAST(0x0000A22D0137AD17 AS DateTime), CAST(0x0000A22D013816DD AS DateTime), N'6f2c8cee-aa36-4f69-a9b9-3f59e5f37d63', N'anonym.27@jsdstr.com', 2, N'Ping at 02.09.2013 18:54:47 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (40, CAST(0x0000A22D013816EF AS DateTime), CAST(0x0000A22D01384B0F AS DateTime), N'9928103d-d484-479d-8a58-4784437377ee', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 18:57:01 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (41, CAST(0x0000A22D01385120 AS DateTime), CAST(0x0000A22D013853B4 AS DateTime), N'ca4093a7-4147-48bf-88e9-d72b669dc965', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 18:57:08 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (42, CAST(0x0000A22D01385729 AS DateTime), CAST(0x0000A22D013857FF AS DateTime), N'9837ead5-2b76-464a-b237-00b25174e1ee', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 18:57:12 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (43, CAST(0x0000A22D0138A7E8 AS DateTime), CAST(0x0000A22D0138A9DE AS DateTime), N'd87afdd2-cec1-40e0-8e9e-9c0a1392e134', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 18:58:22 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (44, CAST(0x0000A22D0138ABA8 AS DateTime), CAST(0x0000A22D013928E7 AS DateTime), N'85e35bd8-1cde-4256-ba8e-3ffe54840a44', N'anonym.27@jsdstr.com', 2, N'Ping at 02.09.2013 18:58:24 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (45, CAST(0x0000A22D013928F4 AS DateTime), CAST(0x0000A22D01392CF3 AS DateTime), N'5e193b21-f993-4720-9322-2d7891f1e328', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:00:14 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (46, CAST(0x0000A22D01392E40 AS DateTime), CAST(0x0000A22D01392F8D AS DateTime), N'29019d03-2cec-458b-a43b-d4fb04c8cb7f', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:00:16 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (47, CAST(0x0000A22D0139312F AS DateTime), CAST(0x0000A22D0139326B AS DateTime), N'62e13e0d-2584-41a6-bcc3-9de1b22ccae5', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:00:18 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (48, CAST(0x0000A22D0139340E AS DateTime), CAST(0x0000A22D01393545 AS DateTime), N'ea2d26b4-b087-4f7d-b5f8-f0fc22a58016', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:00:21 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (49, CAST(0x0000A22D01393785 AS DateTime), CAST(0x0000A22D013938E8 AS DateTime), N'ce8e5700-bb3f-4250-b5a8-2723326e2aba', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:00:24 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (50, CAST(0x0000A22D01393A37 AS DateTime), CAST(0x0000A22D013BB607 AS DateTime), N'a5c9e463-89da-46c6-a735-640262c73788', N'anonym.27@jsdstr.com', 2, N'Ping at 02.09.2013 19:00:29 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (51, CAST(0x0000A22D013BB611 AS DateTime), CAST(0x0000A22D013D3F00 AS DateTime), N'b6eb0597-c1cd-4603-9e73-219a0931f3c5', N'anonym.27@jsdstr.com', 2, N'Ping at 02.09.2013 19:09:29 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (52, CAST(0x0000A22D013D3F0D AS DateTime), CAST(0x0000A22D013D42FF AS DateTime), N'72f6a3fb-b768-4db1-a447-dc1705b0d641', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:15:06 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (53, CAST(0x0000A22D013F134B AS DateTime), CAST(0x0000A22D013F15C0 AS DateTime), N'9a2c4a4f-c320-4be0-8676-e317707b7995', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:21:45 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (54, CAST(0x0000A22D013F1747 AS DateTime), CAST(0x0000A22D013F189C AS DateTime), N'fc59bb09-1fdd-46fc-8cfb-f0f739046498', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:21:47 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (55, CAST(0x0000A22D013F6529 AS DateTime), CAST(0x0000A22D013FC89A AS DateTime), N'a3ee983f-ec83-430e-a8f8-60cebf913053', N'anonym.27@jsdstr.com', 2, N'Created at 02.09.2013 19:22:52 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (56, CAST(0x0000A22D013FC8A2 AS DateTime), CAST(0x0000A22D013FCD5A AS DateTime), N'2e8a19f6-a4bf-4463-8d68-1d6bf9a8da95', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:21 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (57, CAST(0x0000A22D013FCF2F AS DateTime), CAST(0x0000A22D013FD07E AS DateTime), N'fd5114cd-bb1f-471b-a117-06d798372d3e', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:24 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (58, CAST(0x0000A22D013FD26C AS DateTime), CAST(0x0000A22D013FD3F9 AS DateTime), N'7e74f1c5-f739-4ed0-ade0-7b498070de3d', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:27 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (59, CAST(0x0000A22D013FD560 AS DateTime), CAST(0x0000A22D013FD62E AS DateTime), N'68a0be22-ff18-4648-b67b-ec5dbe2a80f6', N'anonym.27@jsdstr.com', 2, N'Ping at 02.09.2013 19:24:29 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (60, CAST(0x0000A22D013FD7B7 AS DateTime), CAST(0x0000A22D013FD8F8 AS DateTime), N'77edfabc-3722-4ec3-a72f-afcdfb8ebdec', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:31 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (61, CAST(0x0000A22D013FD9DF AS DateTime), CAST(0x0000A22D013FDBA2 AS DateTime), N'd300f460-4f16-410b-9aac-93ff4ed0a7cd', N'anonym.27@jsdstr.com', 2, N'Ping at 02.09.2013 19:24:34 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (62, CAST(0x0000A22D013FDD57 AS DateTime), CAST(0x0000A22D013FDE86 AS DateTime), N'ea35cd74-51f0-428f-962e-4d75ee024ec1', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:36 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (63, CAST(0x0000A22D013FE027 AS DateTime), CAST(0x0000A22D013FE15F AS DateTime), N'877a9286-98e1-4017-b051-fabc75c4f8cc', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:38 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (64, CAST(0x0000A22D013FE2D4 AS DateTime), CAST(0x0000A22D013FE3D9 AS DateTime), N'8dba8301-a81b-4445-8678-3de7ce1a20e2', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:41 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (65, CAST(0x0000A22D013FE570 AS DateTime), CAST(0x0000A22D013FE6AB AS DateTime), N'd75b1b79-b3dc-42a4-a67d-b196fa7283bc', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:43 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (66, CAST(0x0000A22D013FE790 AS DateTime), CAST(0x0000A22D013FE8D3 AS DateTime), N'96436623-4792-4fee-812a-264f20154ad2', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:45 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (67, CAST(0x0000A22D013FEAD8 AS DateTime), CAST(0x0000A22D013FECF8 AS DateTime), N'6b578dd3-5a5b-4bd3-9f6d-810624b6d742', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:48 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (68, CAST(0x0000A22D013FEF3D AS DateTime), CAST(0x0000A22D013FF0C3 AS DateTime), N'60440a11-4069-4c4c-bc31-a0f0c8b1e34f', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:24:52 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (69, CAST(0x0000A22D0143E7B6 AS DateTime), CAST(0x0000A22D0143EB4E AS DateTime), N'78865d20-0103-4a2e-aec9-00476339916d', N'anonym.27@jsdstr.com', 2, N'Cancel session at 02.09.2013 19:39:21 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (70, CAST(0x0000A22D0149FD41 AS DateTime), CAST(0x0000A22D014A0443 AS DateTime), N'2136b976-ea1b-4894-8fd0-c11ff17d69e8', N'anonym.28@jsdstr.com', 2, N'Cancel session at 02.09.2013 20:01:33 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (71, CAST(0x0000A22D014A3AF6 AS DateTime), CAST(0x0000A22D014AB539 AS DateTime), N'86d4412e-0a61-41ed-a733-ec2e323326ef', N'anonym.28@jsdstr.com', 2, N'Ping at 02.09.2013 20:02:40 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (72, CAST(0x0000A22D014AB541 AS DateTime), CAST(0x0000A22D014AE9C4 AS DateTime), N'25897d5e-b015-46f4-b489-25500c3228d9', N'anonym.28@jsdstr.com', 2, N'Ping at 02.09.2013 20:04:07 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (73, CAST(0x0000A22D014AEA49 AS DateTime), CAST(0x0000A22D014B78E8 AS DateTime), N'a76ea1f7-9245-40fd-ac36-b4177e3a1370', N'anonym.28@jsdstr.com', 2, N'Ping at 02.09.2013 20:04:53 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (74, CAST(0x0000A22D014B78F0 AS DateTime), CAST(0x0000A22D014B831C AS DateTime), N'f59bddba-40f7-43bf-bed9-07e86e70579e', N'anonym.28@jsdstr.com', 2, N'Ping at 02.09.2013 20:06:59 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (75, CAST(0x0000A22D014B8AD4 AS DateTime), CAST(0x0000A22D014B8CFA AS DateTime), N'528c0894-ae0f-47ea-a229-35ed76b057b1', N'anonym.28@jsdstr.com', 2, N'Cancel session at 02.09.2013 20:07:08 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (76, CAST(0x0000A22D014B8FBC AS DateTime), CAST(0x0000A22D014D5150 AS DateTime), N'11537bdc-eb48-4be5-8343-3e33eb328c19', N'anonym.28@jsdstr.com', 2, N'Ping at 02.09.2013 20:07:44 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (77, CAST(0x0000A22D014BBA5C AS DateTime), CAST(0x0000A22D014BBD47 AS DateTime), N'1c9f7b30-0f18-4c2c-a08f-7ac1aa7b95f6', N'anonym.28@jsdstr.com', 2, N'Cancel session at 02.09.2013 20:07:49 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (78, CAST(0x0000A22D014D5160 AS DateTime), CAST(0x0000A22D014D8325 AS DateTime), N'81f7b322-db56-4d29-bc23-69947f72260e', N'test@test333.com', 2, N'Ping at 02.09.2013 20:13:44 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (79, CAST(0x0000A22D014D8330 AS DateTime), CAST(0x0000A22D014DD9D6 AS DateTime), N'843ae9b4-5481-4744-83c1-8f901cbadc14', N'test@test333.com', 2, N'Created at 02.09.2013 20:14:16 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (80, CAST(0x0000A22D014DD9DD AS DateTime), CAST(0x0000A22D014F1D96 AS DateTime), N'82b224a7-af33-4ad7-8ba6-8609a6486795', N'test@test333.com', 2, N'Created at 02.09.2013 20:15:30 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (81, CAST(0x0000A22D014F1DA0 AS DateTime), CAST(0x0000A22D014F4376 AS DateTime), N'f96bff03-f27c-439f-80f8-9794379a63aa', N'test@test333.com', 2, N'Created at 02.09.2013 20:20:07 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (82, CAST(0x0000A22D014F437B AS DateTime), CAST(0x0000A22D014F6B82 AS DateTime), N'274afae2-9582-43bb-8099-063862cd6252', N'test@test333.com', 2, N'Created at 02.09.2013 20:20:39 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (83, CAST(0x0000A22D014F4B2F AS DateTime), CAST(0x0000A22D014F6B82 AS DateTime), N'e8b00179-615f-49a9-8ca6-61834d6ea3f8', N'test@test333.com', 2, N'Created at 02.09.2013 20:20:46 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (84, CAST(0x0000A22D014F6B8D AS DateTime), CAST(0x0000A22D014F8A54 AS DateTime), N'58065c10-25df-482e-aff9-bd1bc02532a3', N'test@test333.com', 2, N'Ping at 02.09.2013 20:21:21 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (85, CAST(0x0000A22D014F8A62 AS DateTime), CAST(0x0000A22D014F9E18 AS DateTime), N'8c73c356-6401-4366-b6bd-0a0109902a43', N'test@test333.com', 2, N'Created at 02.09.2013 20:21:39 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (86, CAST(0x0000A22D014F9E22 AS DateTime), CAST(0x0000A22D014FE48F AS DateTime), N'137960a0-f6b1-4ffb-96d9-d55873eb2b42', N'test@test333.com', 2, N'Cancel session at 02.09.2013 20:22:56 failed. Invalid session state. Client: Started, Server: Stopped', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (87, CAST(0x0000A22D01508E4B AS DateTime), CAST(0x0000A22D01509B44 AS DateTime), N'9497e481-46a2-4f7c-8bac-e5474d909616', N'test@test333.com', 2, N'Cancel session at 02.09.2013 20:25:32 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (88, CAST(0x0000A22D01511AE7 AS DateTime), CAST(0x0000A22D015195F2 AS DateTime), N'02c8570c-bf8d-453c-99c0-9c35d3bf6d7a', N'test@test333.com', 2, N'Ping at 02.09.2013 20:27:45 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (89, CAST(0x0000A22D01520F96 AS DateTime), CAST(0x0000A22D015211E9 AS DateTime), N'8e446da2-9624-4a41-8f59-92f136d1e4da', N'test@test333.com', 2, N'Ping at 02.09.2013 20:30:52 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (90, CAST(0x0000A22D01523E0B AS DateTime), CAST(0x0000A22D0152467B AS DateTime), N'deb7150c-cccb-45c3-a60f-400d91310230', N'test@test333.com', 2, N'Cancel session at 02.09.2013 20:31:37 failed. Invalid session state. Client: Started, Server: Stopped', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (91, CAST(0x0000A22D01524C1D AS DateTime), CAST(0x0000A22D01524DBC AS DateTime), N'60f39d5d-5c7d-4cc1-a0ae-d254472667d4', N'test@test333.com', 2, N'Cancel session at 02.09.2013 20:31:43 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (92, CAST(0x0000A22D0152F0DF AS DateTime), CAST(0x0000A22D01531A4D AS DateTime), N'8fde249f-50f4-40c3-85b4-9a900d17c557', N'test@test333.com', 2, N'Ping at 02.09.2013 20:34:04 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (93, CAST(0x0000A22D01531AAB AS DateTime), CAST(0x0000A22D01535C3F AS DateTime), N'14fa0173-7ab4-4c17-837f-19c5f98339be', N'test@test333.com', 2, N'Ping at 02.09.2013 20:34:41 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (94, CAST(0x0000A22D01535C46 AS DateTime), CAST(0x0000A22D0153996B AS DateTime), N'6205e1a6-ee30-4338-9376-62cfe13771e2', N'test@test333.com', 2, N'Ping at 02.09.2013 20:35:37 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (95, CAST(0x0000A22D01539973 AS DateTime), CAST(0x0000A22D01539F70 AS DateTime), N'429b74d6-c52c-4a18-8eea-7a3973d1cad0', N'test@test333.com', 2, N'Cancel session at 02.09.2013 20:36:31 failed. Invalid session state. Client: Started, Server: Stopped', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (96, CAST(0x0000A22D0153A993 AS DateTime), CAST(0x0000A22D0153CF64 AS DateTime), N'af7e0115-3048-4d70-bad0-92be6060ff3a', N'test@test333.com', 2, N'Ping at 02.09.2013 20:37:12 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (97, CAST(0x0000A22D0153E635 AS DateTime), CAST(0x0000A22D0153FF97 AS DateTime), N'2a49be24-3f51-48d6-b0db-23c3e5903ee5', N'test@test333.com', 2, N'Cancel session at 02.09.2013 20:37:51 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (98, CAST(0x0000A22D015447CC AS DateTime), CAST(0x0000A22D01544D88 AS DateTime), N'9c489fbd-e065-4ae7-916f-bc30a510c945', N'test@test333.com', 2, N'Ping at 02.09.2013 20:39:00 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (99, CAST(0x0000A22D01545325 AS DateTime), CAST(0x0000A22D0154545D AS DateTime), N'cd5b1057-cf65-4f4e-84da-cd460fd8537a', N'test@test333.com', 2, N'Cancel session at 02.09.2013 20:39:06 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (100, CAST(0x0000A22D015455B4 AS DateTime), CAST(0x0000A22D015851B0 AS DateTime), N'9db5e654-5f10-42ec-b60c-4788e43789cd', N'test@test333.com', 2, N'Ping at 02.09.2013 20:52:59 successfull', NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (101, CAST(0x0000A22D01582932 AS DateTime), CAST(0x0000A22D015851B0 AS DateTime), N'709d70b1-2a42-4a6b-ba0d-028be8554696', N'test@test333.com', 2, N'Created at 02.09.2013 20:53:03 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (102, CAST(0x0000A22D015851C0 AS DateTime), CAST(0x0000A22D015A2FFA AS DateTime), N'a57ae6e2-58c4-4856-9df9-b6ae4d03d134', N'test@test333.com', 2, N'Ping at 02.09.2013 20:54:42 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (103, CAST(0x0000A22D0158A0D2 AS DateTime), CAST(0x0000A22D015A8707 AS DateTime), N'8a18e294-0441-4bc3-b34c-e1de03d7465c', N'test@test333.com', 2, N'Ping at 02.09.2013 21:00:17 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (104, CAST(0x0000A22D015A3002 AS DateTime), CAST(0x0000A22D015A8707 AS DateTime), N'8e9959d2-2003-421f-92aa-de47ec9256cb', N'test@test333.com', 2, N'Ping at 02.09.2013 21:01:29 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (105, CAST(0x0000A22D015A8712 AS DateTime), CAST(0x0000A22D015C6A22 AS DateTime), N'd1b7f028-490c-4e3f-b02c-9d1b7647008e', N'test@test333.com', 2, N'Ping at 02.09.2013 21:07:36 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (106, CAST(0x0000A22D015C3448 AS DateTime), CAST(0x0000A22D015C7D8F AS DateTime), N'1fca8035-c8a7-492f-bd36-8a7df76aea3d', N'test@test333.com', 2, N'Ping at 02.09.2013 21:08:29 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (107, CAST(0x0000A22D015C6A29 AS DateTime), CAST(0x0000A22D015D3C7A AS DateTime), N'eee0df7c-5e04-4115-baee-6eaa3e1d2a25', N'test@test333.com', 2, N'Ping at 02.09.2013 21:08:45 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (108, CAST(0x0000A22D015C7D95 AS DateTime), CAST(0x0000A22D015DFEBB AS DateTime), N'fbf8f9da-162c-4830-a8f0-5ff537fe313e', N'test@test333.com', 2, N'Ping at 02.09.2013 21:11:27 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (109, CAST(0x0000A22D015D3C83 AS DateTime), CAST(0x0000A22D015EBF43 AS DateTime), N'a3a575e4-f3df-4b16-8fdd-9aba9d682a9f', N'test@test333.com', 2, N'Ping at 02.09.2013 21:14:13 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (110, CAST(0x0000A22D015DFEC5 AS DateTime), CAST(0x0000A22D015ECEE9 AS DateTime), N'da948f2c-7068-4d40-a394-0785b118688d', N'test@test333.com', 2, N'Ping at 02.09.2013 21:16:59 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (111, CAST(0x0000A22D015EBF4A AS DateTime), CAST(0x0000A22D015EC93F AS DateTime), N'1d2e0d06-5a5b-4e08-9eb3-6904c0fbae03', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:17:10 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (112, CAST(0x0000A22D015ECEF3 AS DateTime), CAST(0x0000A22D015F181B AS DateTime), N'44714570-3f0e-486a-8082-bf460e5fd645', N'test@test333.com', 2, N'Ping at 02.09.2013 21:18:01 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (113, CAST(0x0000A22D015F0851 AS DateTime), CAST(0x0000A22D015F35CA AS DateTime), N'06bc9f24-0f2e-4020-9809-f147240817d5', N'test@test333.com', 2, N'Ping at 02.09.2013 21:18:12 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (114, CAST(0x0000A22D015F1822 AS DateTime), CAST(0x0000A22D015FB10F AS DateTime), N'd99158a5-3d76-416a-aa65-12a1d29c279b', N'test@test333.com', 2, N'Ping at 02.09.2013 21:18:39 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (115, CAST(0x0000A22D015F35D2 AS DateTime), CAST(0x0000A22D015F381E AS DateTime), N'a60ce4ac-ecad-46dc-9c75-4b329df16b54', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:18:45 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (116, CAST(0x0000A22D015FB116 AS DateTime), CAST(0x0000A22D01613F27 AS DateTime), N'5c295219-7775-46dc-885b-7f7f40020bd4', N'test@test333.com', 2, N'Ping at 02.09.2013 21:24:18 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (117, CAST(0x0000A22D0160C1B8 AS DateTime), CAST(0x0000A22D0163F263 AS DateTime), N'5af56e5d-fd80-4667-9db6-2d4045ba1fcf', N'test@test333.com', 2, N'Ping at 02.09.2013 21:26:06 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (118, CAST(0x0000A22D01613F31 AS DateTime), CAST(0x0000A22D0164173A AS DateTime), N'5d9c7d01-23bf-4d26-b8f6-a30ec31439f6', N'test@test333.com', 2, N'Ping at 02.09.2013 21:35:55 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (119, CAST(0x0000A22D0163F270 AS DateTime), CAST(0x0000A22D01641184 AS DateTime), N'582239d2-b9d8-416f-a30a-575807f981e9', N'test@test333.com', 2, N'Ping at 02.09.2013 21:36:24 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (120, CAST(0x0000A22D01641743 AS DateTime), CAST(0x0000A22D016418F0 AS DateTime), N'c7e8e021-49d4-4e5d-b62d-cd80b498d0a6', N'test@test333.com', 2, N'Ping at 02.09.2013 21:36:30 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (121, CAST(0x0000A22D01641BC6 AS DateTime), CAST(0x0000A22D01641D89 AS DateTime), N'9b3d6b43-1035-4a61-b6f9-fb9ed5446337', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:36:34 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (122, CAST(0x0000A22D01641FE3 AS DateTime), CAST(0x0000A22D016421C9 AS DateTime), N'c72cf5db-3f1b-4b74-aa1d-d8ffb2d9a899', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:36:38 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (123, CAST(0x0000A22D0164E279 AS DateTime), CAST(0x0000A22D0164FAA3 AS DateTime), N'c7663406-1c80-463b-b0de-f2691045494a', N'test@test333.com', 2, N'Ping at 02.09.2013 21:39:43 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (124, CAST(0x0000A22D01650305 AS DateTime), CAST(0x0000A22D016507DA AS DateTime), N'1b97e5ef-6e49-4a46-a876-474dc349522b', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:39:54 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (125, CAST(0x0000A22D01650B72 AS DateTime), CAST(0x0000A22D01650E23 AS DateTime), N'1b1e0a95-6b41-48e4-a9ab-2f85def11da5', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:39:59 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (126, CAST(0x0000A22D016512F2 AS DateTime), CAST(0x0000A22D01651439 AS DateTime), N'86a054fe-653c-48a6-9b2d-9bcd199b0708', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:40:05 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (127, CAST(0x0000A22D016516AB AS DateTime), CAST(0x0000A22D01651844 AS DateTime), N'88ce7923-3e01-416e-98c7-a5f6cee5c17d', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:40:08 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (128, CAST(0x0000A22D01655596 AS DateTime), CAST(0x0000A22D0165693C AS DateTime), N'14a30df5-b1eb-40c4-982f-ec7f3ae9ffb0', N'test@test333.com', 2, N'Ping at 02.09.2013 21:41:17 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (129, CAST(0x0000A22D01657C5A AS DateTime), CAST(0x0000A22D01657F4D AS DateTime), N'9c00fbea-fc80-4419-b64b-1c6dfdfd3ed5', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:41:36 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (130, CAST(0x0000A22D0165900E AS DateTime), CAST(0x0000A22D01659296 AS DateTime), N'91a20c98-259f-4ce0-9a60-b72dc6d376c9', N'test@test333.com', 2, N'Ping at 02.09.2013 21:41:52 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (131, CAST(0x0000A22D01659DF8 AS DateTime), CAST(0x0000A22D0165A17D AS DateTime), N'70143731-e232-4eaf-80d0-ff5d12e31102', N'test@test333.com', 2, N'Ping at 02.09.2013 21:42:05 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (132, CAST(0x0000A22D0165A6F4 AS DateTime), CAST(0x0000A22D0165A830 AS DateTime), N'0d85c977-c0ee-4c27-8e5c-78d9da0e5d36', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:42:11 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (133, CAST(0x0000A22D0165AAC5 AS DateTime), CAST(0x0000A22D0165AC54 AS DateTime), N'311da592-f639-4a45-ad53-9db5cc67e916', N'test@test333.com', 2, N'Ping at 02.09.2013 21:42:14 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (134, CAST(0x0000A22D01661917 AS DateTime), CAST(0x0000A22D01661A94 AS DateTime), N'95a591f2-053c-4c11-a81d-8dec051e7531', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:43:48 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (135, CAST(0x0000A22D01661E80 AS DateTime), CAST(0x0000A22D01662A7E AS DateTime), N'32049ec4-bb96-4669-8fca-38bea6c47d07', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:44:02 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (136, CAST(0x0000A22D01662DED AS DateTime), CAST(0x0000A22D01662F3E AS DateTime), N'98d44c07-c6a7-43f4-99ac-4d6736e0a54c', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:44:06 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (137, CAST(0x0000A22D0166324C AS DateTime), CAST(0x0000A22D0166346B AS DateTime), N'92e5b2e8-63e2-4212-bcf4-3ccb9f92a8e1', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:44:11 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (138, CAST(0x0000A22D01663675 AS DateTime), CAST(0x0000A22D016638FC AS DateTime), N'c008e1e6-a276-49d2-a564-61df1a16ef4b', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:44:14 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (139, CAST(0x0000A22D01663B8F AS DateTime), CAST(0x0000A22D01663F2F AS DateTime), N'8f5958c8-af74-490f-84d8-bae2c4891fb2', N'test@test333.com', 2, N'Ping at 02.09.2013 21:44:20 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (140, CAST(0x0000A22D016670BD AS DateTime), CAST(0x0000A22D016671DC AS DateTime), N'f8078d56-8b0a-475c-9ce1-9a5f1a2fa9f6', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:45:03 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (141, CAST(0x0000A22D016675A0 AS DateTime), CAST(0x0000A22D016677FE AS DateTime), N'787d6e1c-7193-4801-bf63-2d4daa05602a', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:45:08 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (142, CAST(0x0000A22D01667A24 AS DateTime), CAST(0x0000A22D01667BE8 AS DateTime), N'5b759eb2-0ae2-4076-a6c8-5a6f44d89eb8', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:45:12 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (143, CAST(0x0000A22D016686D1 AS DateTime), CAST(0x0000A22D0166880E AS DateTime), N'e0d408ff-f0a2-4f2c-92ae-903287cb316b', N'test@test333.com', 2, N'Cancel session at 02.09.2013 21:45:22 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (144, CAST(0x0000A22D01668F73 AS DateTime), CAST(0x0000A22D016820DA AS DateTime), N'6655e683-e425-4723-8c42-ddde743f4c69', N'test@test333.com', 2, N'Created at 02.09.2013 21:45:28 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (145, CAST(0x0000A22D016820E3 AS DateTime), CAST(0x0000A22D0168DADE AS DateTime), N'abd09790-7c45-4ed1-aec8-8c7f21930e7f', N'test@test333.com', 2, N'Ping at 02.09.2013 21:51:12 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (146, CAST(0x0000A22D0168DAE7 AS DateTime), CAST(0x0000A22D0169E0F6 AS DateTime), N'447a64d5-ca12-4774-85c0-691b95b471c1', N'test@test333.com', 2, N'Created at 02.09.2013 21:53:49 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (147, CAST(0x0000A22D0169E0FE AS DateTime), CAST(0x0000A22D016A3B4B AS DateTime), N'924851af-b320-472b-af06-0f6a5fc772fb', N'test@test333.com', 2, N'Created at 02.09.2013 21:57:33 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (148, CAST(0x0000A22D016A3B57 AS DateTime), CAST(0x0000A22D016ACC97 AS DateTime), N'a44fa261-e1a9-4424-8e02-0ea03f6b65b6', N'test@test333.com', 2, N'Created at 02.09.2013 21:58:50 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (149, CAST(0x0000A22D016ACC9E AS DateTime), CAST(0x0000A22D016AF0D7 AS DateTime), N'2cdf95ef-609b-4f87-85c4-dc1c377ff71d', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:01:25 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (150, CAST(0x0000A22D016AF298 AS DateTime), CAST(0x0000A22D016B0DF8 AS DateTime), N'e09c4946-097c-4d0d-ab05-cf3a0e5ebfaa', N'test@test333.com', 2, N'Created at 02.09.2013 22:01:27 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (151, CAST(0x0000A22D016B0E07 AS DateTime), CAST(0x0000A22D016B42F4 AS DateTime), N'25ab399d-c9a5-4a61-b990-a9d626de6211', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:02:35 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (152, CAST(0x0000A22D016B44A2 AS DateTime), CAST(0x0000A22D016B5679 AS DateTime), N'2c173f86-fb60-4f5a-bc4d-a3cda4de7947', N'test@test333.com', 2, N'Created at 02.09.2013 22:02:37 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (153, CAST(0x0000A22D016B567F AS DateTime), CAST(0x0000A22D016CB6FE AS DateTime), N'9b97cfd4-5f05-41bc-90d9-24dc7790eefc', N'test@test333.com', 2, N'Ping at 02.09.2013 22:02:53 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (154, CAST(0x0000A22D016CB70E AS DateTime), CAST(0x0000A22D016CD16F AS DateTime), N'e8a7f8e1-7e6b-4747-998c-8e6659a4e719', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:08:15 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (155, CAST(0x0000A22D016CE5FD AS DateTime), CAST(0x0000A22D016CE752 AS DateTime), N'5f0c6fb5-31ee-43ad-8c4e-f651463f92cc', N'test@test333.com', 2, N'Ping at 02.09.2013 22:08:34 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (156, CAST(0x0000A22D016CEC26 AS DateTime), CAST(0x0000A22D016CED43 AS DateTime), N'6fa8e155-76a3-4da8-8f60-cd3523e4deed', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:08:39 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (157, CAST(0x0000A22D016CF1A9 AS DateTime), CAST(0x0000A22D016CF506 AS DateTime), N'a0d7b124-2eb8-492a-82f8-640cd9520e1a', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:08:46 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (158, CAST(0x0000A22D016CF736 AS DateTime), CAST(0x0000A22D016CF9C2 AS DateTime), N'd3f8be16-9882-4368-8610-274ab89ea032', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:08:50 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (159, CAST(0x0000A22D016CFD02 AS DateTime), CAST(0x0000A22D016CFE79 AS DateTime), N'4e469e3d-8904-4fcf-a4f1-857a1e38362e', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:08:54 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (160, CAST(0x0000A22D016D006A AS DateTime), CAST(0x0000A22D016D0195 AS DateTime), N'b43f46a7-6505-49f0-8c87-c75e1fcfe69a', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:08:56 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (161, CAST(0x0000A22D016D02FE AS DateTime), CAST(0x0000A22D016D04FB AS DateTime), N'bcd0ba69-7eb5-441e-b44a-897524e6d32f', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:08:59 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (162, CAST(0x0000A22D016D068C AS DateTime), CAST(0x0000A22D016D0937 AS DateTime), N'69d0447d-1968-453b-be5b-9252e786c5de', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:03 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (163, CAST(0x0000A22D016D0E62 AS DateTime), CAST(0x0000A22D016D0FE0 AS DateTime), N'8161f46c-6ada-4996-b763-d6ba1d5286b7', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:09 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (164, CAST(0x0000A22D016D1103 AS DateTime), CAST(0x0000A22D016D1297 AS DateTime), N'83b2d1ac-4c74-4284-abc6-eaa3541f6bee', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:11 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (165, CAST(0x0000A22D016D13F9 AS DateTime), CAST(0x0000A22D016D15C1 AS DateTime), N'de40330b-649b-4215-9d15-04a08ef62b1c', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:14 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (166, CAST(0x0000A22D016D17CF AS DateTime), CAST(0x0000A22D016D192C AS DateTime), N'3da02e41-afd0-4f60-96e6-0fe7430b16fe', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:16 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (167, CAST(0x0000A22D016D1A99 AS DateTime), CAST(0x0000A22D016D1D65 AS DateTime), N'1f32b04b-19e7-4179-98cb-6687b0f0241d', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:20 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (168, CAST(0x0000A22D016D2037 AS DateTime), CAST(0x0000A22D016D21D8 AS DateTime), N'670ee2d4-db7a-49a0-9c38-5b7d9b88bbee', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:24 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (169, CAST(0x0000A22D016D22F2 AS DateTime), CAST(0x0000A22D016D2454 AS DateTime), N'08d61f13-c5a5-470e-b560-53194659014c', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:26 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (170, CAST(0x0000A22D016D2527 AS DateTime), CAST(0x0000A22D016D275F AS DateTime), N'21fb3a6b-7477-4b42-9731-fda7ced489b6', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:29 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (171, CAST(0x0000A22D016D303C AS DateTime), CAST(0x0000A22D016D31DD AS DateTime), N'4e8fb174-86ef-414a-97fd-fda0f194c455', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:38 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (172, CAST(0x0000A22D016D3332 AS DateTime), CAST(0x0000A22D016D350C AS DateTime), N'b304fa4b-6713-4aab-ad6b-cf805bafe68c', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:40 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (173, CAST(0x0000A22D016D367C AS DateTime), CAST(0x0000A22D016D3854 AS DateTime), N'74e47a7e-8504-44bc-812f-c0a9403ce9ca', N'test@test333.com', 2, N'Cancelled at 02.09.2013 22:09:43 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (174, CAST(0x0000A22D016D3996 AS DateTime), CAST(0x0000A22D016DA066 AS DateTime), N'3aaf20db-7a4d-4282-9ea3-be81dcca7714', N'test@test333.com', 2, N'Created at 02.09.2013 22:09:44 successfull', NULL, NULL, NULL)
INSERT [dbo].[Session] ([Id], [CreatedDate], [ChangedDate], [Guid], [UserName], [State], [StateMessage], [DataId], [ResultId], [StatisticsId]) VALUES (175, CAST(0x0000A22D016DA072 AS DateTime), CAST(0x0000A22D016DB337 AS DateTime), N'fd52175d-406c-41b0-9e43-9d8ef8ccab06', N'anonym.33@jsdstr.com', 2, N'Cancelled at 02.09.2013 22:11:28 successfull', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Session] OFF
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Applications]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  '
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_WebEvent_LogEvent]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) COLLATE Ukrainian_CI_AS NOT NULL,
	[LoweredUserName] [nvarchar](256) COLLATE Ukrainian_CI_AS NOT NULL,
	[MobileAlias] [nvarchar](16) COLLATE Ukrainian_CI_AS NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_U__1788CC4D0BC6C43E] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND name = N'aspnet_Users_Index')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND name = N'aspnet_Users_Index2')
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'14eac82c-f2e7-43cf-b871-39d911e88027', N'admin@admin.com', N'admin@admin.com', NULL, 0, CAST(0x0000A22D011BB9EF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'6d25e493-e421-4377-ad45-ab532d1386aa', N'admin@admin11.com', N'admin@admin11.com', NULL, 0, CAST(0x0000A25D014A43E9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'18595324-ff5f-4e2e-a0d3-3be93330adab', N'admin@admina.com', N'admin@admina.com', NULL, 0, CAST(0x0000A25D014A2909 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'e05d1213-5a46-48cf-8afe-0d8e6c8e12d0', N'admin@jsdstr.com', N'admin@jsdstr.com', NULL, 0, CAST(0x0000A23100A56449 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'32259a56-aba8-42fb-b5ee-c87be362ba3c', N'admin1@admin.com', N'admin1@admin.com', NULL, 0, CAST(0x0000A25D014A05F4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'd844b8ec-06b4-4587-b5c1-95f251698543', N'anonym.1@jsdstr.com', N'anonym.1@jsdstr.com', NULL, 0, CAST(0x0000A23100E8CC12 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'81bac12c-977e-4944-95f6-0ec896b53772', N'anonym.10@jsdstr.com', N'anonym.10@jsdstr.com', NULL, 0, CAST(0x0000A25D01494DBD AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'793c3430-a127-4fad-abd5-8027901acdec', N'anonym.11@jsdstr.com', N'anonym.11@jsdstr.com', NULL, 0, CAST(0x0000A25D01495941 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'53c62104-fb38-4fdc-a0d2-d5d67bd260c1', N'anonym.12@jsdstr.com', N'anonym.12@jsdstr.com', NULL, 0, CAST(0x0000A25D0149DFB2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'2dad057c-bd89-4df4-8ef1-103999db644d', N'anonym.13@jsdstr.com', N'anonym.13@jsdstr.com', NULL, 0, CAST(0x0000A25D014E30B1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'9620edea-f1e6-4cc4-910a-834495fc8048', N'anonym.14@jsdstr.com', N'anonym.14@jsdstr.com', NULL, 0, CAST(0x0000A25D015B4F63 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'1f2e280a-ed61-44b1-87d1-8a257b832b26', N'anonym.15@jsdstr.com', N'anonym.15@jsdstr.com', NULL, 0, CAST(0x0000A25D015CC28F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'd38e51c8-1cfb-469c-8774-b5a10245d2aa', N'anonym.16@jsdstr.com', N'anonym.16@jsdstr.com', NULL, 0, CAST(0x0000A25D015DE16D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'd40c0ab7-f113-4b55-9e5d-41a43362b3bb', N'anonym.17@jsdstr.com', N'anonym.17@jsdstr.com', NULL, 0, CAST(0x0000A25D015FC408 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'a99ad0f9-2dc9-4c03-88d9-bd0b543402e8', N'anonym.18@jsdstr.com', N'anonym.18@jsdstr.com', NULL, 0, CAST(0x0000A26A01527C39 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'4e2a8806-b9b6-4903-bab5-10380d511fe3', N'anonym.19@jsdstr.com', N'anonym.19@jsdstr.com', NULL, 0, CAST(0x0000A26A0174E33C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'08cb2a0a-6b60-4916-9247-2c06c32c6c4c', N'anonym.2@jsdstr.com', N'anonym.2@jsdstr.com', NULL, 0, CAST(0x0000A23100E8D6D7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'33d5cf61-50b4-4c73-88b2-5184758c54fb', N'anonym.20@jsdstr.com', N'anonym.20@jsdstr.com', NULL, 0, CAST(0x0000A26A01813BEC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'0543592c-073d-44af-b06e-1c864901011a', N'anonym.21@jsdstr.com', N'anonym.21@jsdstr.com', NULL, 0, CAST(0x0000A26B009A886A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'46fea737-dbb5-4d96-aacc-8a29a17e8c35', N'anonym.22@jsdstr.com', N'anonym.22@jsdstr.com', NULL, 0, CAST(0x0000A26B00B57190 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'c37f1fd3-f34c-408e-9c73-87425d096943', N'anonym.23@jsdstr.com', N'anonym.23@jsdstr.com', NULL, 0, CAST(0x0000A26B00BB5028 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'9386b83c-ef66-4c01-965f-7bbdd745a315', N'anonym.24@jsdstr.com', N'anonym.24@jsdstr.com', NULL, 0, CAST(0x0000A26B00C942D5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'3b4e4430-2bd4-4c0f-a3ca-6b5de992151b', N'anonym.25@jsdstr.com', N'anonym.25@jsdstr.com', NULL, 0, CAST(0x0000A26B00D86D5D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'53310865-ca83-4b75-a61e-97ff441b47ba', N'anonym.26@jsdstr.com', N'anonym.26@jsdstr.com', NULL, 0, CAST(0x0000A26B010BA58C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'8e177544-4c97-4f74-802b-b475c8cd77f0', N'anonym.27@jsdstr.com', N'anonym.27@jsdstr.com', NULL, 0, CAST(0x0000A22D0100A30E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'a95f0d66-fb89-4de0-89dc-a92a5cb955e8', N'anonym.28@jsdstr.com', N'anonym.28@jsdstr.com', NULL, 0, CAST(0x0000A22D01128542 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'8e959fef-638a-4524-90b3-0b89f20f6751', N'anonym.29@jsdstr.com', N'anonym.29@jsdstr.com', NULL, 0, CAST(0x0000A22D011A6380 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'f9588592-4179-44fe-b296-5130d08516f5', N'anonym.3@jsdstr.com', N'anonym.3@jsdstr.com', NULL, 0, CAST(0x0000A23100ED0006 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'651b06dc-5d96-4252-a834-5154a9f2bb3f', N'anonym.30@jsdstr.com', N'anonym.30@jsdstr.com', NULL, 0, CAST(0x0000A22D011AAF51 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'5236564a-2e99-4b6d-a65b-c47d0a198d8d', N'anonym.31@jsdstr.com', N'anonym.31@jsdstr.com', NULL, 0, CAST(0x0000A22D011B3948 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'bfcad543-0c93-4aef-be42-fca971eb6df4', N'anonym.32@jsdstr.com', N'anonym.32@jsdstr.com', NULL, 0, CAST(0x0000A22D011BA52C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'f12e4a2a-27a7-4cf3-89be-7a1283a2d8d2', N'anonym.33@jsdstr.com', N'anonym.33@jsdstr.com', NULL, 0, CAST(0x0000A22D013C20B9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'83701b58-9f5e-4b9e-a46a-c66b9e24ad8f', N'anonym.34@jsdstr.com', N'anonym.34@jsdstr.com', NULL, 0, CAST(0x0000A26B01508910 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'7a1c8ab2-4457-4875-8136-50ef02df94da', N'anonym.4@jsdstr.com', N'anonym.4@jsdstr.com', NULL, 0, CAST(0x0000A23100EDF4C4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'135a4bd1-75e0-4c4d-9072-77849c1c6433', N'anonym.5@jsdstr.com', N'anonym.5@jsdstr.com', NULL, 0, CAST(0x0000A23100F0F47D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'430b8aaa-c100-4f98-aef7-d1c7dcd69ed0', N'anonym.6@jsdstr.com', N'anonym.6@jsdstr.com', NULL, 0, CAST(0x0000A2310127CB1D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'f76149fc-f180-4215-b77d-7a6c8b248004', N'anonym.7@jsdstr.com', N'anonym.7@jsdstr.com', NULL, 0, CAST(0x0000A23101286ABB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'7c187eec-70c6-44ff-a435-141c0b931caa', N'anonym.8@jsdstr.com', N'anonym.8@jsdstr.com', NULL, 0, CAST(0x0000A2310128DE7B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'9a46bd69-78e4-482d-ba64-b8fa86450db9', N'anonym.9@jsdstr.com', N'anonym.9@jsdstr.com', NULL, 0, CAST(0x0000A23101361EA2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'69dc1f31-9843-483a-8bfd-54b9ffe79916', N'tesss@admin.com', N'tesss@admin.com', NULL, 0, CAST(0x0000A23100B3B7BE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'aa00c663-1707-4efc-837b-a8e32cbe6bd4', N'test@test.com', N'test@test.com', NULL, 0, CAST(0x0000A25D01497C71 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'ef66e2db-a1f3-4b3c-9c5b-cef8d11e4bea', N'test@test333.com', N'test@test333.com', NULL, 0, CAST(0x0000A22D011BD20D AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UnRegisterSchemaVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_CheckSchemaVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications_CreateApplication]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) COLLATE Ukrainian_CI_AS NOT NULL,
	[LoweredPath] [nvarchar](256) COLLATE Ukrainian_CI_AS NOT NULL,
 CONSTRAINT [PK__aspnet_P__CD67DC5859063A47] PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]') AND name = N'aspnet_Paths_index')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths] 
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Personalization_GetApplicationId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) COLLATE Ukrainian_CI_AS NOT NULL,
	[LoweredRoleName] [nvarchar](256) COLLATE Ukrainian_CI_AS NOT NULL,
	[Description] [nvarchar](256) COLLATE Ukrainian_CI_AS NULL,
 CONSTRAINT [PK__aspnet_R__8AFACE1B4222D4EF] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND name = N'aspnet_Roles_index1')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles] 
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_RegisterSchemaVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_P__3214EC06656C112C] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND name = N'aspnet_PersonalizationPerUser_index1')
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND name = N'aspnet_PersonalizationPerUser_ncindex2')
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] COLLATE Ukrainian_CI_AS NOT NULL,
	[PropertyValuesString] [ntext] COLLATE Ukrainian_CI_AS NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_P__1788CC4C36B12243] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) COLLATE Ukrainian_CI_AS NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) COLLATE Ukrainian_CI_AS NOT NULL,
	[MobilePIN] [nvarchar](16) COLLATE Ukrainian_CI_AS NULL,
	[Email] [nvarchar](256) COLLATE Ukrainian_CI_AS NULL,
	[LoweredEmail] [nvarchar](256) COLLATE Ukrainian_CI_AS NULL,
	[PasswordQuestion] [nvarchar](256) COLLATE Ukrainian_CI_AS NULL,
	[PasswordAnswer] [nvarchar](128) COLLATE Ukrainian_CI_AS NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] COLLATE Ukrainian_CI_AS NULL,
 CONSTRAINT [PK__aspnet_M__1788CC4D1FCDBCEB] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]') AND name = N'aspnet_Membership_index')
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership] 
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'14eac82c-f2e7-43cf-b871-39d911e88027', N'k1a+ix58o3lr3xn7YsHyMcBPC7A=', 1, N'7swIvxlFyxB3sIb/xJffcA==', NULL, N'admin@admin.com', N'admin@admin.com', NULL, NULL, 1, 0, CAST(0x0000A230013FB99C AS DateTime), CAST(0x0000A22D011BB9EF AS DateTime), CAST(0x0000A230013FB99C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'6d25e493-e421-4377-ad45-ab532d1386aa', N'f7jvFRwR1DjlJDwYXMI19nkDtG4=', 1, N'gYbKAEH/qZWCWU0APjrjpA==', NULL, N'admin@admin11.com', N'admin@admin11.com', NULL, NULL, 1, 0, CAST(0x0000A25D014A4344 AS DateTime), CAST(0x0000A25D014A43E9 AS DateTime), CAST(0x0000A25D014A4344 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'18595324-ff5f-4e2e-a0d3-3be93330adab', N'jK5hlmbKkXGap9721lChIFwT2QA=', 1, N'fJ4ve95LAWmalvsneG6xqQ==', NULL, N'admin@admina.com', N'admin@admina.com', NULL, NULL, 1, 0, CAST(0x0000A25D014A2850 AS DateTime), CAST(0x0000A25D014A2909 AS DateTime), CAST(0x0000A25D014A2850 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'e05d1213-5a46-48cf-8afe-0d8e6c8e12d0', N'W9IUVNisWB6KBWVAQGIGm2OOMhM=', 1, N'3BRSRrucv5qpaQMXFvf/8g==', NULL, N'admin@jsdstr.com', N'admin@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A2300143C460 AS DateTime), CAST(0x0000A23100A56449 AS DateTime), CAST(0x0000A2300143C460 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'32259a56-aba8-42fb-b5ee-c87be362ba3c', N'6vviQoSmgWkBhmW1D5If7FiW0xQ=', 1, N'FPpaT5Bm3Sz1E3z+g/l4Ag==', NULL, N'admin1@admin.com', N'admin1@admin.com', NULL, NULL, 1, 0, CAST(0x0000A25D014A0528 AS DateTime), CAST(0x0000A25D014A05F4 AS DateTime), CAST(0x0000A25D014A0528 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'd844b8ec-06b4-4587-b5c1-95f251698543', N'SRyq9MJZ3wm2Om1L22VNzP5X0yI=', 1, N'SryC06nVWuXoEN3klUaj/Q==', NULL, N'anonym.1@jsdstr.com', N'anonym.1@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A23100E8CBB4 AS DateTime), CAST(0x0000A23100E8CC12 AS DateTime), CAST(0x0000A23100E8CBB4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'81bac12c-977e-4944-95f6-0ec896b53772', N'nqTU8JVYtbedKOmcFu598PT1r/c=', 1, N'YwRnVO5Jp/drHLyGMb4c2w==', NULL, N'anonym.10@jsdstr.com', N'anonym.10@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A25D01494D2C AS DateTime), CAST(0x0000A25D01494DBD AS DateTime), CAST(0x0000A25D01494D2C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'793c3430-a127-4fad-abd5-8027901acdec', N'W6J936Yialnl4QB/Xu9MswDKNnI=', 1, N'm7R3Kp+/j2ATtsE7Dp+D9Q==', NULL, N'anonym.11@jsdstr.com', N'anonym.11@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A25D014958E4 AS DateTime), CAST(0x0000A25D01495941 AS DateTime), CAST(0x0000A25D014958E4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'53c62104-fb38-4fdc-a0d2-d5d67bd260c1', N'yzlySvW5XO0gq2SzvQgJxFT+X60=', 1, N'GLO5ROI7rXDobFPWSj/NDw==', NULL, N'anonym.12@jsdstr.com', N'anonym.12@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A25D0149DE7C AS DateTime), CAST(0x0000A25D0149DFB2 AS DateTime), CAST(0x0000A25D0149DE7C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'2dad057c-bd89-4df4-8ef1-103999db644d', N'+eSFf/K/3JuqP6A1vytUVMXuEkQ=', 1, N'RgXD82Cp+gWYVJkAMHxx1w==', NULL, N'anonym.13@jsdstr.com', N'anonym.13@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A25D014E2F90 AS DateTime), CAST(0x0000A25D014E30B1 AS DateTime), CAST(0x0000A25D014E2F90 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'9620edea-f1e6-4cc4-910a-834495fc8048', N'4//a+EPu/f6WeDyDNRHR8rXMvyY=', 1, N'DuQp6Ciahp9EYQD46DrSnw==', NULL, N'anonym.14@jsdstr.com', N'anonym.14@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A25D015B4E28 AS DateTime), CAST(0x0000A25D015B4F63 AS DateTime), CAST(0x0000A25D015B4E28 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'1f2e280a-ed61-44b1-87d1-8a257b832b26', N'B8gR4vHe40eIgsPPIzL3jVZIpYA=', 1, N'BDIe7xnqQSWYhoAX1vO2Dg==', NULL, N'anonym.15@jsdstr.com', N'anonym.15@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A25D015CC1A4 AS DateTime), CAST(0x0000A25D015CC28F AS DateTime), CAST(0x0000A25D015CC1A4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'd38e51c8-1cfb-469c-8774-b5a10245d2aa', N'eUwSDOxD0tI5xt5U46YmySrM6Tk=', 1, N'WzIqtEwda/D47m86gKodeQ==', NULL, N'anonym.16@jsdstr.com', N'anonym.16@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A25D015DE0C0 AS DateTime), CAST(0x0000A25D015DE16D AS DateTime), CAST(0x0000A25D015DE0C0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'd40c0ab7-f113-4b55-9e5d-41a43362b3bb', N'BY+u9DWz77Q2PQfeXAibPkav1Xc=', 1, N'aaGEvmJhBQGgBqu8Y0Hzqw==', NULL, N'anonym.17@jsdstr.com', N'anonym.17@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A25D015FC390 AS DateTime), CAST(0x0000A25D015FC408 AS DateTime), CAST(0x0000A25D015FC390 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'a99ad0f9-2dc9-4c03-88d9-bd0b543402e8', N'r4ns3ffaQB8prybwCGUJgRRo1FE=', 1, N'+PCJ/YRQOC4F53c6lKUcQw==', NULL, N'anonym.18@jsdstr.com', N'anonym.18@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A26A01527BF4 AS DateTime), CAST(0x0000A26A01527C39 AS DateTime), CAST(0x0000A26A01527BF4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'4e2a8806-b9b6-4903-bab5-10380d511fe3', N'aeDXGARP5Z+5F8HKv/znQBh6iJQ=', 1, N'RfgQZ6tuAUlUssvp8tUG8Q==', NULL, N'anonym.19@jsdstr.com', N'anonym.19@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A26A0174E298 AS DateTime), CAST(0x0000A26A0174E33C AS DateTime), CAST(0x0000A26A0174E298 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'08cb2a0a-6b60-4916-9247-2c06c32c6c4c', N'QLUAkLY2SljHPXaLZYeKRU9IE5k=', 1, N't+VieBebWOUt4XkjeI5UpA==', NULL, N'anonym.2@jsdstr.com', N'anonym.2@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A23100E8D640 AS DateTime), CAST(0x0000A23100E8D6D7 AS DateTime), CAST(0x0000A23100E8D640 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'33d5cf61-50b4-4c73-88b2-5184758c54fb', N'9Z4zw6SiL+6ulzhXVWn8HWazyeY=', 1, N'DGL0gfukQNjPobQtzYw/hA==', NULL, N'anonym.20@jsdstr.com', N'anonym.20@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A26A01813B24 AS DateTime), CAST(0x0000A26A01813BEC AS DateTime), CAST(0x0000A26A01813B24 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'0543592c-073d-44af-b06e-1c864901011a', N'UrCr1Eon7XdXIhIFuAuUY4gSE+Y=', 1, N'ayHnzLwwyskvcWvlhsdy1Q==', NULL, N'anonym.21@jsdstr.com', N'anonym.21@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A26B009A8828 AS DateTime), CAST(0x0000A26B009A886A AS DateTime), CAST(0x0000A26B009A8828 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'46fea737-dbb5-4d96-aacc-8a29a17e8c35', N'uLua1hck0TylM7dHAUaHQMRpVKs=', 1, N'7KU04Fb6USihWCGkuWxIkA==', NULL, N'anonym.22@jsdstr.com', N'anonym.22@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A26B00B57070 AS DateTime), CAST(0x0000A26B00B57190 AS DateTime), CAST(0x0000A26B00B57070 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'c37f1fd3-f34c-408e-9c73-87425d096943', N'jzH4wM4neZPzILgyBaFN+KxfWKE=', 1, N'XwpPvF0aGffDRKIdv5a2yQ==', NULL, N'anonym.23@jsdstr.com', N'anonym.23@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A26B00BB4FF4 AS DateTime), CAST(0x0000A26B00BB5028 AS DateTime), CAST(0x0000A26B00BB4FF4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'9386b83c-ef66-4c01-965f-7bbdd745a315', N'n1y7vhyUJwYBgUq0+V74MUryhjk=', 1, N'7XpLlZ3dPrKYmcLoNMIOvg==', NULL, N'anonym.24@jsdstr.com', N'anonym.24@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A26B00C942A8 AS DateTime), CAST(0x0000A26B00C942D5 AS DateTime), CAST(0x0000A26B00C942A8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'3b4e4430-2bd4-4c0f-a3ca-6b5de992151b', N'PGO6K72FTNSygmO0fWU5sUxYvns=', 1, N'sLdR/1jBPx/gVhh+aUXT6g==', NULL, N'anonym.25@jsdstr.com', N'anonym.25@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A26B00D86D14 AS DateTime), CAST(0x0000A26B00D86D5D AS DateTime), CAST(0x0000A26B00D86D14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'53310865-ca83-4b75-a61e-97ff441b47ba', N'/Ubg6ROKVNLCr72sNVp1fiZ6JiI=', 1, N'kwaSYUYGODd9u1GO/0fH/g==', NULL, N'anonym.26@jsdstr.com', N'anonym.26@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A26B010BA404 AS DateTime), CAST(0x0000A26B010BA58C AS DateTime), CAST(0x0000A26B010BA404 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'8e177544-4c97-4f74-802b-b475c8cd77f0', N'9wh9yHs3lC7baBL5Z9N2WsrA/60=', 1, N'MI/5SG5GU+8spGv7fdG7IQ==', NULL, N'anonym.27@jsdstr.com', N'anonym.27@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A22D0100A2D4 AS DateTime), CAST(0x0000A22D0100A30E AS DateTime), CAST(0x0000A22D0100A2D4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'a95f0d66-fb89-4de0-89dc-a92a5cb955e8', N'HvZTfjDCTJexsPZYiIg62QfPevo=', 1, N'jBS0Uj5+Fxhoo9TAxS1LcQ==', NULL, N'anonym.28@jsdstr.com', N'anonym.28@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A22D0112842C AS DateTime), CAST(0x0000A22D01128542 AS DateTime), CAST(0x0000A22D0112842C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'8e959fef-638a-4524-90b3-0b89f20f6751', N'EjKTVnN6kXZqBjfrCqw/ZloNdSE=', 1, N'zsm0itGmEJK4GuR0Iu+AEQ==', NULL, N'anonym.29@jsdstr.com', N'anonym.29@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A22D011A62A0 AS DateTime), CAST(0x0000A22D011A6380 AS DateTime), CAST(0x0000A22D011A62A0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'f9588592-4179-44fe-b296-5130d08516f5', N'MUCAkaVr/Z/hEnYwNt4TeB6UgqI=', 1, N'+OS3VHLIfuhSQaictjm6zw==', NULL, N'anonym.3@jsdstr.com', N'anonym.3@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A23100ECFF7C AS DateTime), CAST(0x0000A23100ED0006 AS DateTime), CAST(0x0000A23100ECFF7C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'651b06dc-5d96-4252-a834-5154a9f2bb3f', N'OcvskVyn5ye4h16NWzL3679a3H8=', 1, N'fW3tfgV1W1Z+u1kHw28LBg==', NULL, N'anonym.30@jsdstr.com', N'anonym.30@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A22D011AAECC AS DateTime), CAST(0x0000A22D011AAF51 AS DateTime), CAST(0x0000A22D011AAECC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'5236564a-2e99-4b6d-a65b-c47d0a198d8d', N'KyHUTiHXtdjP8iGMOiqEOETAQyQ=', 1, N'nGpshN/0xDeJILpe0jCAwQ==', NULL, N'anonym.31@jsdstr.com', N'anonym.31@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A22D011B3914 AS DateTime), CAST(0x0000A22D011B3948 AS DateTime), CAST(0x0000A22D011B3914 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'bfcad543-0c93-4aef-be42-fca971eb6df4', N'qYSpGr0DhmFXHm+eubT36R5GcvU=', 1, N'EOL6Mz+6SsuhlRZSmQhJSw==', NULL, N'anonym.32@jsdstr.com', N'anonym.32@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A22D011BA4E4 AS DateTime), CAST(0x0000A22D011BA52C AS DateTime), CAST(0x0000A22D011BA4E4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'f12e4a2a-27a7-4cf3-89be-7a1283a2d8d2', N'HfmfQNmgJ3bmbZBf+pAqHUMLwdY=', 1, N'BnFCn4K/Yx69NKhbMRsgxg==', NULL, N'anonym.33@jsdstr.com', N'anonym.33@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A22D013C2084 AS DateTime), CAST(0x0000A22D013C20B9 AS DateTime), CAST(0x0000A22D013C2084 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'83701b58-9f5e-4b9e-a46a-c66b9e24ad8f', N'oqwu1fPsmDi7Znlvk2SG0TIRIdg=', 1, N'77N/oNlTreNMHrYTQfQtlA==', NULL, N'anonym.34@jsdstr.com', N'anonym.34@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A26B015088BC AS DateTime), CAST(0x0000A26B01508910 AS DateTime), CAST(0x0000A26B015088BC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'7a1c8ab2-4457-4875-8136-50ef02df94da', N's5pyefHkdFnsH+T+SaD1YScUvqc=', 1, N'bRePVlbGD1eIauO8KfZ3fw==', NULL, N'anonym.4@jsdstr.com', N'anonym.4@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A23100EDF468 AS DateTime), CAST(0x0000A23100EDF4C4 AS DateTime), CAST(0x0000A23100EDF468 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'135a4bd1-75e0-4c4d-9072-77849c1c6433', N'ZDosb7sqwnPhhJqoXC/tfxdReWU=', 1, N'wtRU0b5q4r1exLorIlHp3g==', NULL, N'anonym.5@jsdstr.com', N'anonym.5@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A23100F0F3FC AS DateTime), CAST(0x0000A23100F0F47D AS DateTime), CAST(0x0000A23100F0F3FC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'430b8aaa-c100-4f98-aef7-d1c7dcd69ed0', N'gSAUueZXfmmyfd/e5jKKjmvrLVo=', 1, N'z0o8htfqpgoNXT8gBz9FdQ==', NULL, N'anonym.6@jsdstr.com', N'anonym.6@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A2310127CB0C AS DateTime), CAST(0x0000A2310127CB1D AS DateTime), CAST(0x0000A2310127CB0C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'f76149fc-f180-4215-b77d-7a6c8b248004', N'6DXiYqSzGOiS91Ifk40ZujY78hs=', 1, N'Sj5EXMpJXu/Yj+wpHeYx6g==', NULL, N'anonym.7@jsdstr.com', N'anonym.7@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A23101286A6C AS DateTime), CAST(0x0000A23101286ABB AS DateTime), CAST(0x0000A23101286A6C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'7c187eec-70c6-44ff-a435-141c0b931caa', N'ovZzmXMaF454YJX/biZvvS1FSis=', 1, N'EGQw8wSOE3TMtxWd7nDjAw==', NULL, N'anonym.8@jsdstr.com', N'anonym.8@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A2310128DE70 AS DateTime), CAST(0x0000A2310128DE7B AS DateTime), CAST(0x0000A2310128DE70 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'9a46bd69-78e4-482d-ba64-b8fa86450db9', N'SEyO9wSe+7Mu7a+SqvNKgGzskp0=', 1, N'O2TJGIflqLgvGvdqmV9IUA==', NULL, N'anonym.9@jsdstr.com', N'anonym.9@jsdstr.com', NULL, NULL, 1, 0, CAST(0x0000A23101361DD8 AS DateTime), CAST(0x0000A23101361EA2 AS DateTime), CAST(0x0000A23101361DD8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'69dc1f31-9843-483a-8bfd-54b9ffe79916', N'SNoiY5CWcMGbABHPYPuYTBwAXsE=', 1, N've8/0d6BB+/i0xXG1POo2A==', NULL, N'tesss@admin.com', N'tesss@admin.com', NULL, NULL, 1, 0, CAST(0x0000A23100B3B6A4 AS DateTime), CAST(0x0000A23100B3B7BE AS DateTime), CAST(0x0000A23100B3B6A4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'aa00c663-1707-4efc-837b-a8e32cbe6bd4', N'DbK/7AoCW8bh4uKUdQCzEBzGwT4=', 1, N'mWhszSdmHailYh4wvGibkw==', NULL, N'test@test.com', N'test@test.com', NULL, NULL, 1, 0, CAST(0x0000A25D01496A78 AS DateTime), CAST(0x0000A25D01497C71 AS DateTime), CAST(0x0000A25D01496A78 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'd80745d1-d1f7-4811-98a2-e8064d8b8959', N'ef66e2db-a1f3-4b3c-9c5b-cef8d11e4bea', N's/b12AJVxjVkTlwr97Hmqkv8RKw=', 1, N'xuTnP+aKkJ8UXVUKY3KY0w==', NULL, N'test@test333.com', N'test@test333.com', NULL, NULL, 1, 0, CAST(0x0000A22D011BD16C AS DateTime), CAST(0x0000A22D011BD20D AS DateTime), CAST(0x0000A22D011BD16C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths_CreatePath]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_P__CD67DC5960A75C0F] PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users_CreateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_RoleExists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_GetAllRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__aspnet_U__AF2760AD47DBAE45] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND name = N'aspnet_UsersInRoles_index')
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Users]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Roles]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  '
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_CreateRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_Paths]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_User]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_Shared]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_UsersInRoles]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  '
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_DeleteInactiveProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Profiles]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_MembershipUsers]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  '
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'''', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_IsUserInRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_GetUsersInRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_GetRolesForUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_FindUsersInRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_AddUsersToRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users_DeleteUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_MembershipUsers'') AND (type = ''V''))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_UsersInRoles'') AND (type = ''V''))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_Profiles'') AND (type = ''V''))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_WebPartState_User'') AND (type = ''V''))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_DeleteRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UpdateUserInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            SET @LastLockoutDate = CONVERT( datetime, ''17540101'', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UpdateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UnlockUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 ),
        LastLockoutDate = CONVERT( datetime, ''17540101'', 112 )
    WHERE @UserId = UserId

    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_SetPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_ResetPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByUserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByEmail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetPasswordWithFormat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetNumberOfUsersOnline]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetAllUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_FindUsersByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_FindUsersByEmail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_CreateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, ''17540101'', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_AnyDataInTables]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_MembershipUsers'') AND (type = ''V''))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N''aspnet_Membership''
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_Roles'') AND (type = ''V''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N''aspnet_Roles''
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_Profiles'') AND (type = ''V''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N''aspnet_Profile''
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_WebPartState_User'') AND (type = ''V''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N''aspnet_PersonalizationPerUser''
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''aspnet_WebEvent_LogEvent'') AND (type = ''P''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N''aspnet_WebEvent_Events''
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N''aspnet_Users''
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N''aspnet_Applications''
            RETURN
        END
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_ResetUserState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_ResetSharedState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_GetCountOfState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_FindState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_DeleteAllState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_SetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_GetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_SetProperties]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetProperties]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 09/03/2013 15:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_DeleteProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N'','', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END' 
END
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__08EA5793]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Ap__Appli__08EA5793]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Ap__Appli__08EA5793]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Applications] ADD  CONSTRAINT [DF__aspnet_Ap__Appli__08EA5793]  DEFAULT (newid()) FOR [ApplicationId]
END


End
GO
/****** Object:  Default [DF__aspnet_Me__Passw__239E4DCF]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Me__Passw__239E4DCF]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Me__Passw__239E4DCF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Membership] ADD  CONSTRAINT [DF__aspnet_Me__Passw__239E4DCF]  DEFAULT ((0)) FOR [PasswordFormat]
END


End
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__5BE2A6F2]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Pa__PathI__5BE2A6F2]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Pa__PathI__5BE2A6F2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Paths] ADD  CONSTRAINT [DF__aspnet_Pa__PathI__5BE2A6F2]  DEFAULT (newid()) FOR [PathId]
END


End
GO
/****** Object:  Default [DF__aspnet_Perso__Id__6754599E]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Perso__Id__6754599E]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Perso__Id__6754599E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  CONSTRAINT [DF__aspnet_Perso__Id__6754599E]  DEFAULT (newid()) FOR [Id]
END


End
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__44FF419A]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Ro__RoleI__44FF419A]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Ro__RoleI__44FF419A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Roles] ADD  CONSTRAINT [DF__aspnet_Ro__RoleI__44FF419A]  DEFAULT (newid()) FOR [RoleId]
END


End
GO
/****** Object:  Default [DF__aspnet_Us__UserI__0EA330E9]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__UserI__0EA330E9]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Us__UserI__0EA330E9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__UserI__0EA330E9]  DEFAULT (newid()) FOR [UserId]
END


End
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__0F975522]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__Mobil__0F975522]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Us__Mobil__0F975522]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__Mobil__0F975522]  DEFAULT (NULL) FOR [MobileAlias]
END


End
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__108B795B]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__IsAno__108B795B]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__aspnet_Us__IsAno__108B795B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__IsAno__108B795B]  DEFAULT ((0)) FOR [IsAnonymous]
END


End
GO
/****** Object:  Default [DF__Session__Created__1EA48E88]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Session__Created__1EA48E88]') AND parent_object_id = OBJECT_ID(N'[dbo].[Session]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Session__Created__1EA48E88]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF__Session__Created__1EA48E88]  DEFAULT (getdate()) FOR [CreatedDate]
END


End
GO
/****** Object:  Default [DF__Session__Changed__1F98B2C1]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Session__Changed__1F98B2C1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Session]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Session__Changed__1F98B2C1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF__Session__Changed__1F98B2C1]  DEFAULT (getdate()) FOR [ChangedDate]
END


End
GO
/****** Object:  Default [DF__Settings__Create__00200768]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Settings__Create__00200768]') AND parent_object_id = OBJECT_ID(N'[dbo].[Settings]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Settings__Create__00200768]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF__Settings__Create__00200768]  DEFAULT (getdate()) FOR [CreatedDate]
END


End
GO
/****** Object:  Default [DF__Settings__Change__01142BA1]    Script Date: 09/03/2013 15:42:20 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__Settings__Change__01142BA1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Settings]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__Settings__Change__01142BA1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF__Settings__Change__01142BA1]  DEFAULT (getdate()) FOR [ChangedDate]
END


End
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__21B6055D]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__Appli__21B6055D]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Me__Appli__21B6055D] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__Appli__21B6055D]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership] CHECK CONSTRAINT [FK__aspnet_Me__Appli__21B6055D]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__22AA2996]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__UserI__22AA2996]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Me__UserI__22AA2996] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__UserI__22AA2996]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership] CHECK CONSTRAINT [FK__aspnet_Me__UserI__22AA2996]
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__5AEE82B9]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pa__Appli__5AEE82B9]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]'))
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pa__Appli__5AEE82B9] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pa__Appli__5AEE82B9]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]'))
ALTER TABLE [dbo].[aspnet_Paths] CHECK CONSTRAINT [FK__aspnet_Pa__Appli__5AEE82B9]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__628FA481]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__628FA481]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]'))
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__PathI__628FA481] FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__628FA481]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]'))
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] CHECK CONSTRAINT [FK__aspnet_Pe__PathI__628FA481]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__68487DD7]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__68487DD7]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__PathI__68487DD7] FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__68487DD7]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] CHECK CONSTRAINT [FK__aspnet_Pe__PathI__68487DD7]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__693CA210]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__UserI__693CA210]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__UserI__693CA210] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__UserI__693CA210]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] CHECK CONSTRAINT [FK__aspnet_Pe__UserI__693CA210]
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__38996AB5]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pr__UserI__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]'))
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pr__UserI__38996AB5] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pr__UserI__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]'))
ALTER TABLE [dbo].[aspnet_Profile] CHECK CONSTRAINT [FK__aspnet_Pr__UserI__38996AB5]
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__440B1D61]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Ro__Appli__440B1D61]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]'))
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Ro__Appli__440B1D61] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Ro__Appli__440B1D61]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]'))
ALTER TABLE [dbo].[aspnet_Roles] CHECK CONSTRAINT [FK__aspnet_Ro__Appli__440B1D61]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__0DAF0CB0]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__Appli__0DAF0CB0]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__Appli__0DAF0CB0] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__Appli__0DAF0CB0]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
ALTER TABLE [dbo].[aspnet_Users] CHECK CONSTRAINT [FK__aspnet_Us__Appli__0DAF0CB0]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__4AB81AF0]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__RoleI__4AB81AF0]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__RoleI__4AB81AF0] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__RoleI__4AB81AF0]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__RoleI__4AB81AF0]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__49C3F6B7]    Script Date: 09/03/2013 15:42:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__UserI__49C3F6B7]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__UserI__49C3F6B7] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__UserI__49C3F6B7]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__UserI__49C3F6B7]
GO
GRANT EXECUTE ON [dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Membership_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Personalization_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Profile_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Profile_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Roles_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_CheckSchemaVersion] TO [aspnet_WebEvent_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer] TO [aspnet_Membership_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_CreateUser] TO [aspnet_Membership_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_FindUsersByEmail] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_FindUsersByName] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetAllUsers] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetNumberOfUsersOnline] TO [aspnet_Membership_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetNumberOfUsersOnline] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetPassword] TO [aspnet_Membership_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetPasswordWithFormat] TO [aspnet_Membership_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetUserByEmail] TO [aspnet_Membership_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetUserByEmail] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetUserByName] TO [aspnet_Membership_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetUserByName] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetUserByUserId] TO [aspnet_Membership_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_GetUserByUserId] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_ResetPassword] TO [aspnet_Membership_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_SetPassword] TO [aspnet_Membership_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_UnlockUser] TO [aspnet_Membership_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_UpdateUser] TO [aspnet_Membership_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Membership_UpdateUserInfo] TO [aspnet_Membership_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Paths_CreatePath] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Personalization_GetApplicationId] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] TO [aspnet_Personalization_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationAdministration_FindState] TO [aspnet_Personalization_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] TO [aspnet_Personalization_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] TO [aspnet_Personalization_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationAdministration_ResetUserState] TO [aspnet_Personalization_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Profile_DeleteInactiveProfiles] TO [aspnet_Profile_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Profile_DeleteProfiles] TO [aspnet_Profile_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles] TO [aspnet_Profile_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Profile_GetProfiles] TO [aspnet_Profile_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Profile_GetProperties] TO [aspnet_Profile_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Profile_SetProperties] TO [aspnet_Profile_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_RegisterSchemaVersion] TO [aspnet_Membership_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_RegisterSchemaVersion] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_RegisterSchemaVersion] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_RegisterSchemaVersion] TO [aspnet_Personalization_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_RegisterSchemaVersion] TO [aspnet_Profile_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_RegisterSchemaVersion] TO [aspnet_Profile_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_RegisterSchemaVersion] TO [aspnet_Roles_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_RegisterSchemaVersion] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_RegisterSchemaVersion] TO [aspnet_WebEvent_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Roles_CreateRole] TO [aspnet_Roles_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Roles_DeleteRole] TO [aspnet_Roles_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Roles_GetAllRoles] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Roles_RoleExists] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UnRegisterSchemaVersion] TO [aspnet_Membership_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UnRegisterSchemaVersion] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UnRegisterSchemaVersion] TO [aspnet_Personalization_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UnRegisterSchemaVersion] TO [aspnet_Personalization_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UnRegisterSchemaVersion] TO [aspnet_Profile_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UnRegisterSchemaVersion] TO [aspnet_Profile_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UnRegisterSchemaVersion] TO [aspnet_Roles_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UnRegisterSchemaVersion] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UnRegisterSchemaVersion] TO [aspnet_WebEvent_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_Users_DeleteUser] TO [aspnet_Membership_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UsersInRoles_AddUsersToRoles] TO [aspnet_Roles_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UsersInRoles_FindUsersInRole] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UsersInRoles_GetRolesForUser] TO [aspnet_Roles_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UsersInRoles_GetRolesForUser] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UsersInRoles_GetUsersInRoles] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UsersInRoles_IsUserInRole] TO [aspnet_Roles_BasicAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UsersInRoles_IsUserInRole] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles] TO [aspnet_Roles_FullAccess] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[aspnet_WebEvent_LogEvent] TO [aspnet_WebEvent_FullAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_Applications] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_Applications] TO [aspnet_Personalization_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_Applications] TO [aspnet_Profile_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_Applications] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_MembershipUsers] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_Profiles] TO [aspnet_Profile_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_Roles] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_Users] TO [aspnet_Membership_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_Users] TO [aspnet_Personalization_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_Users] TO [aspnet_Profile_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_Users] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_UsersInRoles] TO [aspnet_Roles_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_WebPartState_Paths] TO [aspnet_Personalization_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_WebPartState_Shared] TO [aspnet_Personalization_ReportingAccess] AS [dbo]
GO
GRANT SELECT ON [dbo].[vw_aspnet_WebPartState_User] TO [aspnet_Personalization_ReportingAccess] AS [dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_BasicAccess')
BEGIN
EXEC dbo.sp_addrolemember @rolename=N'aspnet_Membership_BasicAccess', @membername=N'aspnet_Membership_FullAccess'

END
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_ReportingAccess')
BEGIN
EXEC dbo.sp_addrolemember @rolename=N'aspnet_Membership_ReportingAccess', @membername=N'aspnet_Membership_FullAccess'

END
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_BasicAccess')
BEGIN
EXEC dbo.sp_addrolemember @rolename=N'aspnet_Personalization_BasicAccess', @membername=N'aspnet_Personalization_FullAccess'

END
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_ReportingAccess')
BEGIN
EXEC dbo.sp_addrolemember @rolename=N'aspnet_Personalization_ReportingAccess', @membername=N'aspnet_Personalization_FullAccess'

END
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_BasicAccess')
BEGIN
EXEC dbo.sp_addrolemember @rolename=N'aspnet_Profile_BasicAccess', @membername=N'aspnet_Profile_FullAccess'

END
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_ReportingAccess')
BEGIN
EXEC dbo.sp_addrolemember @rolename=N'aspnet_Profile_ReportingAccess', @membername=N'aspnet_Profile_FullAccess'

END
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_BasicAccess')
BEGIN
EXEC dbo.sp_addrolemember @rolename=N'aspnet_Roles_BasicAccess', @membername=N'aspnet_Roles_FullAccess'

END
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_ReportingAccess')
BEGIN
EXEC dbo.sp_addrolemember @rolename=N'aspnet_Roles_ReportingAccess', @membername=N'aspnet_Roles_FullAccess'

END
GO
