package com.web.test;

import com.web.bean.PaperForSearch;
import com.web.bean.User;
import com.web.dao.UserMapper;
import com.web.service.PaperService;
import com.web.service.UserService;
import org.apache.ibatis.session.SqlSession;
import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.deletebyquery.DeleteByQueryAction;
import org.elasticsearch.action.deletebyquery.DeleteByQueryRequestBuilder;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.plugin.deletebyquery.DeleteByQueryPlugin;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.fasterxml.jackson.databind.ObjectMapper;
import javax.swing.*;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import static org.elasticsearch.index.query.QueryBuilders.multiMatchQuery;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Test {
//    @Autowired
//    UserMapper userMapper;
//
//    @Autowired
//    SqlSession sqlSession;
    @Autowired
    private PaperService paperService;


    private static final String HOST = "127.0.0.1";
    private static final int PORT = 9300;

    private static final ObjectMapper MAPPER = new ObjectMapper();
    private TransportClient client = null;

    @org.junit.Test
    public void test(){

        List<PaperForSearch> list = paperService.selectPaperForSearch();
        for(PaperForSearch pfs : list){
            System.out.println(pfs.getId() + pfs.getName());
        }
    }

    @org.junit.Test
    public void createDocumentByJson() throws Exception{
        List<PaperForSearch> plist = paperService.selectPaperForSearch();
        for(PaperForSearch pfs : plist) {
            System.out.println(pfs.getId() + pfs.getName());

            Map<String, Object> source = new HashMap<String, Object>();
            source.put("id", pfs.getId());
            source.put("name", pfs.getName());
            source.put("popularity", pfs.getPopularity());
            source.put("abstract1", pfs.getAbstract1());

            // 也可以转化java的bean
            String json = MAPPER.writeValueAsString(source);
            IndexResponse response = this.client.prepareIndex("pfs", "PaperForSearch")
                    .setSource(json)
                    .execute()
                    .actionGet();
        }

        // 获取结果
//        String index = response.getIndex();
//        String type = response.getType();
//        String id = response.getId();
//        long version = response.getVersion();
//        boolean created = response.isCreated();

//        System.out.println("索引是: " + index);
//        System.out.println("类型是: " + type);
//        System.out.println("文档id是: " + id);
//        System.out.println("版本是: " + version);
//        System.out.println("是否创建: " + created);
    }

    @org.junit.Test
    public void testQuery() {
        SearchResponse searchResponse = this.client.prepareSearch("pfs").setTypes("PaperForSearch")
                // 搜索会忽略大小写,使用小写来搜索
                .setQuery(multiMatchQuery("1521","name", "abstract1"))
                .get();

        // 查询的总数(命中数)
        SearchHits hits = searchResponse.getHits();
        long totalHits = hits.getTotalHits();
        System.out.println("总记录数: " + totalHits);
        // 遍历查询的结果
        Iterator<SearchHit> iterator = hits.iterator();
        while (iterator.hasNext()) {
            SearchHit next = iterator.next();
            // System.out.println(next.getSourceAsString());

            Map<String, Object> source = next.getSource();
            Integer id = (Integer) source.get("id");
            String name = (String) source.get("name");

            System.out.println("id: " + id);
            System.out.println("name: " + name);
        }
    }



    @org.junit.Test
    public void deleteDocument(){
        StringBuilder b = new StringBuilder();
        b.append("{\"query\":{\"match_all\":{}}}");
        DeleteByQueryRequestBuilder response = new DeleteByQueryRequestBuilder(client, DeleteByQueryAction.INSTANCE);
        response.setIndices("pfs").setTypes("PaperForSearch").setSource(b.toString())
                .execute()
                .actionGet();


    }


    // 获取客户端
    @Before
    public void getClient() throws Exception{
        client = TransportClient.builder()
                .addPlugin(DeleteByQueryPlugin.class)
                .build()
                .addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(HOST), PORT));
    }

    // 关闭客户端
    @After
    public void closeClient(){
        if (this.client != null){
            this.client.close();
        }
    }
}
