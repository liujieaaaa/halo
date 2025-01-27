package cc.ryanc.halo.repository;

import cc.ryanc.halo.model.domain.Logs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author : RYAN0UP
 * @version : 1.0
 * description :
 * @date : 2018/1/19
 */
public interface LogsRepository extends JpaRepository<Logs,Integer> {

    /**
     * 查询最新的五条数据
     * @return list
     */
    @Query(value = "SELECT * FROM halo_logs ORDER BY log_id DESC LIMIT 5",nativeQuery = true)
    List<Logs> findTopFive();
}
