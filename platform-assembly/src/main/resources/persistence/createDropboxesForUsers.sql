set @userDropBoxesId = (SELECT component_id FROM component_spec where external_key = '/UserDropBoxes');
-- admin in group admin
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Sandbox', 'gov.nasa.arc.mct.core.components.MineTaxonomyComponent', null, 'admin', '48bbd8f3830d4da9b275af8594ee7780', 'admin', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = '48bbd8f3830d4da9b275af8594ee7780';
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('admin\'s Drop Box', 'gov.nasa.arc.mct.core.components.TelemetryUserDropBoxComponent', null, '*', 'cf446a13d3d547f3a6ce1d9c4e5d3a7c', 'admin', NOW());
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('48bbd8f3830d4da9b275af8594ee7780', 'cf446a13d3d547f3a6ce1d9c4e5d3a7c', 0);
set @userDropBoxesMaxSeq = (SELECT COALESCE(MAX(seq_no),0) FROM component_relationship where component_id = @userDropBoxesId);
insert  into component_relationship  (component_id, associated_component_id, seq_no) values (@userDropBoxesId, 'cf446a13d3d547f3a6ce1d9c4e5d3a7c', @userDropBoxesMaxSeq + 1);
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Favorites', 'gov.nasa.arc.mct.core.components.MyFavoritesComponent', null, 'admin', 'ba1882f62a22450aa6645ce5b34f6834', 'admin', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = 'ba1882f62a22450aa6645ce5b34f6834';
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('48bbd8f3830d4da9b275af8594ee7780', 'ba1882f62a22450aa6645ce5b34f6834', 1);
-- testUser1 in group TestUsers
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Sandbox', 'gov.nasa.arc.mct.core.components.MineTaxonomyComponent', null, 'testUser1', '12369936afea4141a47f31af93dd36f5', 'testUser1', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = '12369936afea4141a47f31af93dd36f5';
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('testUser1\'s Drop Box', 'gov.nasa.arc.mct.core.components.TelemetryUserDropBoxComponent', null, '*', '750226ec5af64ce09332f932179ac753', 'testUser1', NOW());
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('12369936afea4141a47f31af93dd36f5', '750226ec5af64ce09332f932179ac753', 0);
set @userDropBoxesMaxSeq = (SELECT COALESCE(MAX(seq_no),0) FROM component_relationship where component_id = @userDropBoxesId);
insert  into component_relationship  (component_id, associated_component_id, seq_no) values (@userDropBoxesId, '750226ec5af64ce09332f932179ac753', @userDropBoxesMaxSeq + 1);
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Favorites', 'gov.nasa.arc.mct.core.components.MyFavoritesComponent', null, 'testUser1', 'cdd1df1ae0a04e25ae8cd4815b4be89f', 'testUser1', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = 'cdd1df1ae0a04e25ae8cd4815b4be89f';
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('12369936afea4141a47f31af93dd36f5', 'cdd1df1ae0a04e25ae8cd4815b4be89f', 1);
-- testUser2 in group TestUsers
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Sandbox', 'gov.nasa.arc.mct.core.components.MineTaxonomyComponent', null, 'testUser2', '53c85602de8042eab33c65f98edead3d', 'testUser2', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = '53c85602de8042eab33c65f98edead3d';
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('testUser2\'s Drop Box', 'gov.nasa.arc.mct.core.components.TelemetryUserDropBoxComponent', null, '*', 'd160b0bf2fdf437fbac9d4f1f605e09c', 'testUser2', NOW());
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('53c85602de8042eab33c65f98edead3d', 'd160b0bf2fdf437fbac9d4f1f605e09c', 0);
set @userDropBoxesMaxSeq = (SELECT COALESCE(MAX(seq_no),0) FROM component_relationship where component_id = @userDropBoxesId);
insert  into component_relationship  (component_id, associated_component_id, seq_no) values (@userDropBoxesId, 'd160b0bf2fdf437fbac9d4f1f605e09c', @userDropBoxesMaxSeq + 1);
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Favorites', 'gov.nasa.arc.mct.core.components.MyFavoritesComponent', null, 'testUser2', '4cff57e467b04b24b07ca8899c7f9bc4', 'testUser2', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = '4cff57e467b04b24b07ca8899c7f9bc4';
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('53c85602de8042eab33c65f98edead3d', '4cff57e467b04b24b07ca8899c7f9bc4', 1);
-- testUser3 in group TestUsers
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Sandbox', 'gov.nasa.arc.mct.core.components.MineTaxonomyComponent', null, 'testUser3', '735e8159acfb43dda23da501281e779c', 'testUser3', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = '735e8159acfb43dda23da501281e779c';
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('testUser3\'s Drop Box', 'gov.nasa.arc.mct.core.components.TelemetryUserDropBoxComponent', null, '*', 'dd48333e9ca440aba063296b257b249f', 'testUser3', NOW());
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('735e8159acfb43dda23da501281e779c', 'dd48333e9ca440aba063296b257b249f', 0);
set @userDropBoxesMaxSeq = (SELECT COALESCE(MAX(seq_no),0) FROM component_relationship where component_id = @userDropBoxesId);
insert  into component_relationship  (component_id, associated_component_id, seq_no) values (@userDropBoxesId, 'dd48333e9ca440aba063296b257b249f', @userDropBoxesMaxSeq + 1);
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Favorites', 'gov.nasa.arc.mct.core.components.MyFavoritesComponent', null, 'testUser3', 'd3e267ea7ad245a0a2ff329dee88d2f2', 'testUser3', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = 'd3e267ea7ad245a0a2ff329dee88d2f2';
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('735e8159acfb43dda23da501281e779c', 'd3e267ea7ad245a0a2ff329dee88d2f2', 1);
-- testUser4 in group TestUsers
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Sandbox', 'gov.nasa.arc.mct.core.components.MineTaxonomyComponent', null, 'testUser4', 'bc06d5b124be416c8425a02326ab08ad', 'testUser4', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = 'bc06d5b124be416c8425a02326ab08ad';
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('testUser4\'s Drop Box', 'gov.nasa.arc.mct.core.components.TelemetryUserDropBoxComponent', null, '*', 'e5dd1c1a9b724f2a9e924888547c8c20', 'testUser4', NOW());
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('bc06d5b124be416c8425a02326ab08ad', 'e5dd1c1a9b724f2a9e924888547c8c20', 0);
set @userDropBoxesMaxSeq = (SELECT COALESCE(MAX(seq_no),0) FROM component_relationship where component_id = @userDropBoxesId);
insert  into component_relationship  (component_id, associated_component_id, seq_no) values (@userDropBoxesId, 'e5dd1c1a9b724f2a9e924888547c8c20', @userDropBoxesMaxSeq + 1);
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Favorites', 'gov.nasa.arc.mct.core.components.MyFavoritesComponent', null, 'testUser4', 'a06a5fb2085241a3bf39b02c742660f6', 'testUser4', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = 'a06a5fb2085241a3bf39b02c742660f6';
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('bc06d5b124be416c8425a02326ab08ad', 'a06a5fb2085241a3bf39b02c742660f6', 1);
-- testUser5 in group TestUsers
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Sandbox', 'gov.nasa.arc.mct.core.components.MineTaxonomyComponent', null, 'testUser5', 'e1955d9091b24cb7b76f99cc5ab3190c', 'testUser5', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = 'e1955d9091b24cb7b76f99cc5ab3190c';
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('testUser5\'s Drop Box', 'gov.nasa.arc.mct.core.components.TelemetryUserDropBoxComponent', null, '*', 'd882776e7e0c46daa947446585254734', 'testUser5', NOW());
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('e1955d9091b24cb7b76f99cc5ab3190c', 'd882776e7e0c46daa947446585254734', 0);
set @userDropBoxesMaxSeq = (SELECT COALESCE(MAX(seq_no),0) FROM component_relationship where component_id = @userDropBoxesId);
insert  into component_relationship  (component_id, associated_component_id, seq_no) values (@userDropBoxesId, 'd882776e7e0c46daa947446585254734', @userDropBoxesMaxSeq + 1);
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Favorites', 'gov.nasa.arc.mct.core.components.MyFavoritesComponent', null, 'testUser5', '47a261e05d0b4638bf6b3e7541128b08', 'testUser5', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = '47a261e05d0b4638bf6b3e7541128b08';
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('e1955d9091b24cb7b76f99cc5ab3190c', '47a261e05d0b4638bf6b3e7541128b08', 1);
-- testUser6 in group TestUsers
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Sandbox', 'gov.nasa.arc.mct.core.components.MineTaxonomyComponent', null, 'testUser6', 'f3f10142ac6d4a9d80123f031be85c70', 'testUser6', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = 'f3f10142ac6d4a9d80123f031be85c70';
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('testUser6\'s Drop Box', 'gov.nasa.arc.mct.core.components.TelemetryUserDropBoxComponent', null, '*', 'c012d58f15af4e7c8710c5c8e6559e65', 'testUser6', NOW());
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('f3f10142ac6d4a9d80123f031be85c70', 'c012d58f15af4e7c8710c5c8e6559e65', 0);
set @userDropBoxesMaxSeq = (SELECT COALESCE(MAX(seq_no),0) FROM component_relationship where component_id = @userDropBoxesId);
insert  into component_relationship  (component_id, associated_component_id, seq_no) values (@userDropBoxesId, 'c012d58f15af4e7c8710c5c8e6559e65', @userDropBoxesMaxSeq + 1);
insert into component_spec (component_name,  component_type,  model_info, owner, component_id, creator_user_id, date_created) values ('My Favorites', 'gov.nasa.arc.mct.core.components.MyFavoritesComponent', null, 'testUser6', 'f23984c114c94748bf89cb1932c60f07', 'testUser6', NOW());
insert into tag_association (component_id, tag_id) select component_id, 'bootstrap:creator' from component_spec where component_id = 'f23984c114c94748bf89cb1932c60f07';
insert  into component_relationship  (component_id, associated_component_id, seq_no) values ('f3f10142ac6d4a9d80123f031be85c70', 'f23984c114c94748bf89cb1932c60f07', 1);
