default['fuseki']['version'] = "1.0.1"
default['fuseki']['path'] = "/user/fuseki/"
default['fuseki']['data'] = "/usr/fuseki/data/"
default['fuseki']['name'] = "fuseki"
default['fuseki']['update'] = true
default['fuseki']['port'] = 3030
default['fuseki']['localhostonly'] = false
default['fuseki']['services'] = [{
								'name' => 'ds',
								'serviceQuery' => ['query','sparql'],
								'serviceUpdate' => ['update'],
								'serviceUpload' => ['serviceUpload'],
								'serviceReadWriteGraphStore' => ['data'],
								'serviceReadGraphstore' => ['get'],
								'dataset' => {
										'name' => 'dataset',
										
									}
								}]